public class AccountAction {

   @InvocableMethod
    public static List<String> getAccountNames(List<Id> ids) {
        List<string> acctNames = new List<String>();
        List<Account> accounts = [SELECT Name FROM Account WHERE Id IN :ids];
        
        for(Account acct :accounts) {
            acctNames.add(acct.Name);
        }
        return acctNames;
    }
}