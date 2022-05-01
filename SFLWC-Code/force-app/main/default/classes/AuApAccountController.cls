public class AuApAccountController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> lstAccts = [SELECT Id, Name FROM Account LIMIT 5];
        return lstAccts;
    }
}