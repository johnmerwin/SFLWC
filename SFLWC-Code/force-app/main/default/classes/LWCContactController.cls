public with sharing class LWCContactController {
    public LWCContactController() {

    }

    @AuraEnabled (Cacheable=true)
    public static List<Contact> getContactsWithAccountId(String acctId) {
        return [SELECT Id, LastName, FirstName, Phone FROM Contact WHERE AccountId = :acctId LIMIT 10];
    }

    @AuraEnabled (Cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id, LastName, FirstName, Phone FROM Contact LIMIT 10];
    }
}