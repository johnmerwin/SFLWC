@isTest
public class TestUpdateAccount {
    
    @isTest
    private static void testUpdateAccounts() {
        // Create an account and a contact for testing the UpdateAccount class
        // This data will not be inserted in the Org.
        Account acct = new Account(Name = 'Test Account', Rating = 'Hot', Active__c = 'No');
        insert acct;
        
        Contact con = new Contact();
        con.LastName = 'Test';
        con.FirstName = 'Account';
        con.AccountId = acct.Id;
        insert con;
        
        UpdateAccount.updateAccountsWithContacts();
        // Query the account to see if it is updated correctly
        Account updatedAcct = [SELECT Rating FROM Account WHERE Id = :acct.Id];
        System.assertEquals('Warm', updatedAcct.Rating);
    } 
}