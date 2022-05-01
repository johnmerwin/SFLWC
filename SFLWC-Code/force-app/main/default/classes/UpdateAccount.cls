public class UpdateAccount {
    
    public static void updateAccountsWithContacts(){
      
        List<Account> lstAcctsToUpdate = new List<Account>();
        Set<Id> setAcctIds = new Set<Id>();
        List<Contact> lstCons = [SELECT Id, Account.Id FROM Contact
                                 WHERE NAME LIKE '%Test%' AND Account.Id != NULL];
        
        for(Contact tmpCon: lstCons) {
            if(!setAcctIds.contains(tmpCon.Account.Id)) {
                Account acct = new Account();
                
                System.debug('Account Id => ' + tmpCon.Account.Id);
                acct.Id = tmpCon.Account.Id;
                acct.Rating = 'Warm';
                acct.Active__c = 'Yes';
                
                lstAcctsToUpdate.add(acct);
                setAcctIds.add(tmpCon.Account.Id);
            }
            if(!lstAcctsToUpdate.isEmpty()){
                update lstAcctsToUpdate;
            }
            
        }
    }
    
}