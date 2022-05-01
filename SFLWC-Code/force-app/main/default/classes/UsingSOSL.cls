public class UsingSOSL {

    public static void searchWithSOSL() {
        List<List<sObject>> searchObj = [FIND 'TEST' IN ALL FIELDS RETURNING Account(Name)];
        List<Account> lstAcct = new List<Account>();
        
        // Note that we are typecasting the searchObj to
        // an Account. The Account list will be the first
        // list in the array of list. Hence the index 0;
        
        lstAcct = (List<Account>)searchObj[0];
        for(Account tmpAcct : lstAcct) {
            System.debug('Name => ' + tmpAcct.Name);
        }
    }
}