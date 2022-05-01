@isTest
public class NewTestTrgAccountHandler {
    @isTest
    public static void testAccountHandler() {
        // Use test data created by another class
        
        List<Account> lstAccts = GenerateTestData.createAccounts(2, false);
        
        for(Integer i = 0; i < lstAccts.size(); i++){
            lstAccts[i].BillingStreet = 'Billing Street' + i;
            lstAccts[i].BillingCity = 'Billing City' + i;
            lstAccts[i].BillingState = 'Billing State' + i;
            lstAccts[i].BillingCountry = 'Billing Country' + i;
        }
        
        // Insert the accounts in the list. The trigger
        // will then call the Account Handler automatically
        
        // startTest() and stopTest() are used to reset the 
        // governor limits
        Test.startTest();
        insert lstAccts;
        Test.stopTest();
        
        List<Account> lstInsertedAccts = [SELECT ShippingCity FROM Account];
        
        for(Integer i = 0; i < lstInsertedAccts.size(); i++){
        	System.assertEquals('Billing City'+i,lstInsertedAccts[i].ShippingCity);
        }
    }
    
    
}