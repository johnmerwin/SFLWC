public class trgOppAfterEventsHandler {
    
    public static void afterInsertRevenueUpdate(List<Opportunity> lstOpps){
        
        List<Account> lstAcctsToUpdate = new List<Account>();
        Set<Id> acctIds = new Set<Id>();
        
        for(Opportunity tmpOpp: lstOpps){
            if(tmpOpp.AccountId != null){
                // This opp. is linked with an account
                acctIds.add(tmpOpp.AccountId);    
            }
        }
        lstAcctsToUpdate = calculateAnnualRevenue(acctIds);
        if(!lstAcctsToUpdate.isEmpty()){
            update lstAcctsToUpdate;
        }
    }
    
    public static void afterUpdateRevenueUpdate(List<Opportunity> lstOpps, Map<Id, Opportunity> oldMap) {
        
        List<Account> lstAcctsToUpdate = new List<Account>();
        Set<Id> acctIds = new Set<Id>();
        
        for(Opportunity tmpOpp: lstOpps){
            // Determine if Opp Amount linked to this account is updated
            if(tmpOpp.AccountId != null && 
               (tmpOpp.Amount != oldMap.get(tmpOpp.Id).Amount)){
                   acctIds.add(tmpOpp.AccountId);    
               }
        }
        
        lstAcctsToUpdate = calculateAnnualRevenue(acctIds);
        if(!lstAcctsToUpdate.isEmpty()){
            update lstAcctsToUpdate;
        }
    }
    
    public static void afterDeleteRevenueUpdate(List<Opportunity> lstOpps) {
        
        List<Account> lstAcctsToUpdate = new List<Account>();
        Set<Id> acctIds = new Set<Id>();
        
        for(Opportunity tmpOpp: lstOpps){
            if(tmpOpp.AccountId != null){
                // This opp. is linked with an account
                acctIds.add(tmpOpp.AccountId);    
            }
        }
        lstAcctsToUpdate = calculateAnnualRevenue(acctIds);
        if(!lstAcctsToUpdate.isEmpty()){
            update lstAcctsToUpdate;
        }
    }
    
    // Oppotunity count update on Account object
    
    public static void afterInsertOppCountUpdate(List<Opportunity> lstNew){
        
        List<Account> lstAcctsToUpdate = new List<Account>();
        Set<Id> acctIds = new Set<Id>();
        
        for(Opportunity tmpOpp: lstNew){
            if(tmpOpp.AccountId != null){
                // This opp. is linked with an account
                acctIds.add(tmpOpp.AccountId);    
            }
        }
        lstAcctsToUpdate = calculateOppCount(acctIds);
        if(!lstAcctsToUpdate.isEmpty()){
            update lstAcctsToUpdate;
        }
    }
    
    public static List<Account> calculateOppCount(Set<Id> acctIds) {
        
        List<Account> lstAcctsToUpdate = new List<Account>();
        // List all the opportunities that are associated with
        // an account
        List<Opportunity> lstOpps = [SELECT AccountId  From Opportunity
                                     WHERE AccountId IN :acctIds];
        
        Map<Id, Decimal> accIdOppCount = new Map<Id, Decimal>();
        
        for(Opportunity opp: lstOpps) {
            Decimal totalCount = 0;
            
            if(accIdOppCount.containsKey(opp.AccountId)){
                totalCount = accIdOppCount.get(opp.AccountId); 
            } 
            totalCount += 1;
            
            accIdOppCount.put(opp.AccountId, totalCount);
        }
        
        if(!accIdOppCount.isEmpty()) {
            for(Id i: accIdOppCount.keySet()){
                Account acct = new Account();
                acct.Id = i;
                acct.Opportunity_Count__c = accIdOppCount.get(i);
                lstAcctsToUpdate.add(acct);
            }
        }
        return lstAcctsToUpdate;
    }
    
    public static List<Account> calculateAnnualRevenue(Set<Id> acctIds) {
        
        List<Account> lstAcctsToUpdate = new List<Account>();
        // List all the opportunities that are associated with
        // an account
        List<Opportunity> lstOpps = [SELECT AccountId, Amount From Opportunity
                                     WHERE AccountId IN :acctIds];
        
        Map<Id, Decimal> accIdAnnualRevenue = new Map<Id, Decimal>();
        
        for(Opportunity opp: lstOpps) {
            Decimal totalAmount = 0;
            
            if(accIdAnnualRevenue.containsKey(opp.AccountId)){
                totalAmount = accIdAnnualRevenue.get(opp.AccountId); 
            }
            if(opp.Amount != null){
                totalAmount += opp.Amount; 
            }
            accIdAnnualRevenue.put(opp.AccountId, totalAmount);
        }
        
        if(!accIdAnnualRevenue.isEmpty()) {
            for(Id i: accIdAnnualRevenue.keySet()){
                Account acct = new Account();
                acct.Id = i;
                acct.AnnualRevenue = accIdAnnualRevenue.get(i);
                lstAcctsToUpdate.add(acct);
            }
        }
        return lstAcctsToUpdate;
    }
}