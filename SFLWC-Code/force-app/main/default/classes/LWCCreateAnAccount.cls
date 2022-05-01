public with sharing class LWCCreateAnAccount {
    public LWCCreateAnAccount() {

    }
    @AuraEnabled
    public static Account createAccount(Account acctRec){
        try{
            insert acctRec;
            return acctRec;
        } 
        catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> createMutipleAccounts(List<Account> lstAccts){
        try{
            insert lstAccts;
            return lstAccts;
        } 
        catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
}