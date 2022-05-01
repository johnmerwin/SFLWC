public class FutureAcctCalculator {
    
    // To implement a future method we need to annotate it
    // with the @future keyword
    @future
    public static void countContacts(List<Id> acctIds){
        List<Account> lstAccts = [SELECT Id, (SELECT Id FROM Contacts) 
                                  FROM Account WHERE Id IN :acctIds];
        for(Account acct: lstAccts){
            acct.Number_of_Contacts__c = acct.Contacts.size(); 
        }
        if(!lstAccts.isEmpty()){
            update lstAccts;
        }
    }
    
    /*
          This is how we will call this method from the debug window
      
          List <Account> lstAccts = [SELECT Id, (SELECT Id FROM Contacts) FROM Account 
                               WHERE Id IN (SELECT AccountId  FROM Contact)];

        List<Id> lstAcctIds = new List<Id>();
        
        for(Account acct: lstAccts){
            lstAcctIds.add(acct.Id);
        }
        
        FutureAcctCalculator.countContacts(lstAcctIds);
 
    */ 
}