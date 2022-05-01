public class trgAccountBeforeEventsHandler {
    
    public static void insertDescription(List<Account> lstAccounts) {
        for(Account tmpAcct :lstAccounts) {
            tmpAcct.Description = 'A new account record has been inserted';
        }
    }
    
    public static void updateDescription(List<Account> lstAccounts, Map<Id, Account> mapIdAcct){
        for(Account tmpAcct :lstAccounts) {
            // Phone # has been updated
            if(tmpAcct.Phone != mapIdAcct.get(tmpAcct.Id).Phone) {
              tmpAcct.Description = 'Phone # has been updated';  
            }
        }
    }
    
    public static void deleteAccount(List<Account> lstAccounts) {
        for(Account tmpAcct :lstAccounts) {
            if(tmpAcct.Active__c == 'Yes') {
              tmpAcct.addError('An active Account cannot be deleted');
            }
        }
    }
        
}