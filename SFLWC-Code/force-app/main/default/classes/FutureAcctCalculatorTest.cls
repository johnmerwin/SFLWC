@isTest
public class FutureAcctCalculatorTest {
    
    @isTest
    public static void countContactsTest(){
        //List<Account> lstAccts = new List<Account>();
        List<Id> acctIds = new List<id>();
        
        Account acct  = new Account();
        acct.Name = 'Future Method Test';
        insert acct;
        acctIds.add(acct.Id);
        
        Contact con = new Contact();
        con.AccountId = acct.Id;
        con.LastName = 'Future';
        insert con;
        
        Test.startTest();
        FutureAcctCalculator.countContacts(acctIds);
        Test.stopTest();
        
        Account testAcct = [SELECT Id, Number_of_Contacts__c FROM Account];
        System.assertEquals(1, testAcct.Number_of_Contacts__c);
    }
}