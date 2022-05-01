public with sharing class LWCOppController {
    public LWCOppController() {

    }

    @AuraEnabled (Cacheable=true)
    public static List<Opportunity> getOppsWithAccountId(String acctId) {
        return [SELECT Id, Name, CloseDate, StageName, Amount FROM Opportunity WHERE AccountId = :acctId LIMIT 10];
    }

}