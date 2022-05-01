@isTest
public class TestTrgAccountHandler {
    
    @isTest
    public static void testAccountHandler() {
        // Create Test Data
        List<Account> lstAccts = new List<Account>();
        
        for(Integer i = 1; i <= 2; i++){
            Account acct = new Account();
            
            acct.Name = 'Test' + i;
            acct.BillingStreet = 'Billing Street' + i;
            acct.BillingCity = 'Billing City' + i;
            acct.BillingState = 'Billing State' + i;
            acct.BillingCountry = 'Billing Country' + i;
            
            lstAccts.add(acct);
        }
        
        // Insert the accounts in the list. The trigger
        // will then call the Account Handler automatically
       
        // startTest() and stopTest() are used to reset the 
        // governor limits
        Test.startTest();
        insert lstAccts;
        Test.stopTest();
            
        List<Account> lstUpdAccts = [SELECT ShippingCity FROM Account WHERE Id =: lstAccts[0].Id];
      
        //System.debug(lstUpdAccts);
        System.assertEquals('Billing City1',lstUpdAccts[0].ShippingCity);
    }
    
}