public class trgAccount01Handler {
    
    public static void beforeInsertAccount(List<Account> lstAccts) {
        for(Account acct: lstAccts){
            //System.debug('Size =>' + Trigger.size);
            acct.Description = 'Description inserted from trigger Helper class';
        }
    }
    
    public static void updateRating(List<Account> lstAccts) {
        for(Account acct: lstAccts){
            //System.debug('Size =>' + Trigger.size);
            if(acct.Industry == 'Media'){
                acct.Rating = 'Hot';
            }
        }
    }
    
    public static void createRelatedOpp(List<Account> lstAccts) {
        // Afer an Account is inserted,then its Ids will be
        // available in the 'after insert' context. We will be
        // using these Ids to create related Opportunity records.
        
        List<Opportunity> lstOpps = new List<Opportunity>();
        
        for(Account acct: lstAccts){
            Opportunity opp = new Opportunity();
            
            opp.Name = acct.name + ' Opp';
            opp.AccountId = acct.Id;
            opp.Amount = 400000;
            opp.Type = 'New Customer';
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today().addDays(30);
            
            lstOpps.add(opp);
        }
        if(!lstOpps.isEmpty()) {
            insert lstOpps;
        }
    }
    
    public static void updateAccountDesc(List<Account> lstAcctsNew, Map<Id, Account> oldMap){
        // If phone # number is updated, include a message 
        // in the description field
        // 
        for(Account tmpAcct: lstAcctsNew){
            // Check if value is updated by comparing the
            // new phone with the old phone number
            if(tmpAcct.Phone != oldMap.get(tmpAcct.Id).Phone) {
                tmpAcct.Description = 'Phone number field was updated';
            }
        }
    }
    
    public static void updatePhoneInOpp(List<Account> lstAcctsNew, Map<Id, Account> oldMap){
        // IMPORTANT! Understand the logic of this method thoroughly
        // It is called from the trgAccount01
        
        // If Account phone # number is updated, include a message 
        // in the description field and copy the Account Phone #
        // into the Account_Phone__c field in Opportunity.
       
        List<Opportunity> lstOpps = new List<Opportunity>();
        Map<Id, Account> mapIdAcct = new Map<Id, Account>();
        
        for(Account tmpAcct: lstAcctsNew){
            // Check if value is updated by comparing the
            // new phone with the old phone number
            
            if(tmpAcct.Phone != oldMap.get(tmpAcct.Id).Phone) {
                // Store the information of only those 
                // records where the phone field is modified
                mapIdAcct.put(tmpAcct.Id, tmpAcct);
            }
            
            for (Opportunity tmpOpp: [SELECT Id, AccountId, Account_Phone__c FROM Opportunity WHERE 
                                      AccountId IN :mapIdAcct.keySet()])
                // Get only those Opportunities that are linked
                // to an account; 
            {
                Opportunity opp = new Opportunity();
                opp.Id = tmpOpp.Id;
                opp.Description = 'Phone # is updated to parent account phone number';
                opp.Account_Phone__c = mapIdAcct.get(tmpOpp.AccountId).Phone;
                
                lstOpps.add(opp);
            }
            if(!lstOpps.isEmpty()) {
                update lstOpps;
            }
        }
    }
}