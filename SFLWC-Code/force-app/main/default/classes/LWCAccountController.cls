public with sharing class LWCAccountController {
    public LWCAccountController() {

    }

    @AuraEnabled (cacheable=true)
    // Set cacheable = true when you want to use this method
    // with the @wire decorator
    public static List<Account> getAccounts(){
         return [SELECT Id, Name, Industry, Rating FROM Account LIMIT 10];
    }

    @AuraEnabled
    // Note that we have removed the (cacheable=true) in this 
    // method as we will be using it imperatively
    public static List<Account> getAccountsImperative(){
         return [SELECT Id, Name, Industry, Rating FROM Account WHERE INDUSTRY != NULL ORDER BY Name LIMIT 10];
    }
}