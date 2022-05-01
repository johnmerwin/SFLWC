public class GenerateTestData {
    
    // We will be using this class to generate data
    // for other test classes. 
    public static List<Account> createAccounts(Integer intCount, Boolean toBeInserted)
    {
        List<Account> lstAccts = new List<Account>();
        for(Integer i = 0; i < intCount; i++){
            Account acct = new Account();
            acct.Name = 'Test' + i;
            lstAccts.add(acct);
        }
        if(toBeInserted) {
            insert lstAccts;
        }
        return lstAccts;
    }

}