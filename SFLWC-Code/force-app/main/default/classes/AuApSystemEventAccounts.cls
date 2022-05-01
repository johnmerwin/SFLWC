public class AuApSystemEventAccounts {

    @AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account ORDER BY Name LIMIT 10];
    }
}