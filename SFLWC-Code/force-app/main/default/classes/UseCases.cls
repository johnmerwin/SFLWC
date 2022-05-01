public class UseCases {
    
    public static void createOppsForAccounts() {
        List<Account> lstAccts = [SELECT Id, Name FROM Account WHERE Name LIKE 'Test%'];
        List<Opportunity> lstOpps = new List<Opportunity>();
 
        if (lstAccts.size() > 0) {
            for (Account tmpAcct : lstAccts) {
                Opportunity tmpOpp = new Opportunity();
                tmpOpp.AccountId = tmpAcct.Id;
                tmpOpp.Name = tmpAcct.Name + ' - Opportunity';
                tmpOpp.CloseDate = date.parse('05/31/2022');
                tmpOpp.StageName = 'Prospecting';
                
                // We are bulkifying here
                lstOpps.add(tmpOpp);
            }
            // Commit the records to the database
            insert lstOpps;
            System.debug('We are done!');
        }
        
    }
    
    public static void updateAccountPhone() {
        List<Account> lstAccts = [SELECT Id, Phone, Name FROM Account WHERE Name LIKE 'Test%'];
        
        if(lstAccts.size() >0) {
            for(Account tmpAcct: lstAccts){
                System.debug('Name => ' + tmpAcct.Name);
                tmpAcct.Phone = '2026231111';
            }
            // Do a mass update
            update lstAccts;
        }
        else {
            System.debug('No Accounts found for this criteria');
        }
    }
    
    public static void updateOppDescription() {
       List<Opportunity> lstOpps = [SELECT Id, Name, Description, StageName FROM Opportunity WHERE 
                                    CreatedDate = LAST_WEEK];
        if(lstOpps.size() >0) {
            for(Opportunity tmpOpp: lstOpps){
                System.debug('Name => ' + tmpOpp.Name + ' Stage => ' + tmpOpp.StageName);
                //System.debug('Stage => ' + tmpOpp.StageName);
                if ((tmpOpp.StageName == 'Closed Won') || (tmpOpp.StageName == 'Closed Lost')){
                    System.debug('Found!');
                    tmpOpp.Description = tmpOpp.StageName; 
                }
                else 
                {
                   tmpOpp.Description = 'No description required';  
                }
            }
            // Do a mass update
            update lstOpps;
        }
        else {
            System.debug('No Opportunities found for this criteria');
        } 
    }
    
    public static void updateTotalContacts(){
        List<Account> lstAccts = [SELECT Id, Name, Number_of_Contacts__c, 
                                   (SELECT Id, Name FROM Contacts) FROM Account];
        Integer intContacts = 0;
        
        for(Account tmpAcct: lstAccts) {
            // Count the # of contacts for this account
            for(Contact tmpCon: tmpAcct.Contacts) {
               intContacts = intContacts + 1; 
            }
            tmpAcct.Number_of_Contacts__c = intContacts;
            intContacts = 0;
        }
        update lstAccts;
    }
    
}