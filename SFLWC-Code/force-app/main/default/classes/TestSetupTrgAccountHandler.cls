@isTest
public class TestSetupTrgAccountHandler {
    
    @testSetup
    public static void setupAccountData() {
        // Create Test Data. The accounts created here
        // will be available in all subsequent methods
        // of this class.
        List<Account> lstAccts = new List<Account>();
        
        for(Integer i = 0; i < 2; i++){
            Account acct = new Account();
            
            acct.Name = 'Test' + i;
            acct.BillingStreet = 'Test Street' + i;
            acct.BillingCity = 'Test City' + i;
            acct.BillingState = 'Test State' + i;
            acct.BillingCountry = 'Test Country' + i;
            
            lstAccts.add(acct);
        }
        insert lstAccts;
    }
    
    @isTest
    public static void testInsertAccount(){
        Account acct = [SELECT ShippingCity, Phone, Id, Name FROM Account WHERE Name = 'Test0'];
        System.assertEquals('Test City0', acct.ShippingCity);
        
        acct.Phone = '2026239111';
        update acct;
        
        Account updAcct = [SELECT ShippingCity, Phone, Id, Name FROM Account WHERE Name = 'Test0'];
        System.assertEquals('Test City0', acct.ShippingCity);
    }
    
    @isTest
    public static void testUpdateAccount(){
        Account acct = [SELECT ShippingCity, Phone, Id, Name FROM Account WHERE Name = 'Test0'];
                
        acct.Phone = '2026239111';
        update acct;
        
        Account updAcct = [SELECT Phone, Id FROM Account WHERE Name = 'Test0'];
        System.assertEquals('2026239111', acct.Phone);
    }    
}