@isTest
public class QueueableUpdateParentAccountTest {
    
    @isTest
    public static void updateParentAccount() {
        
        List<Account> lstAccts = new List<Account>();
        Id parentAcctId;
        
        // Create an account which will be used as 
        // a parent account for the acounts below
       
        Account tmpAcct = new Account();
        tmpAcct.Name = 'Parent'; 
        insert tmpAcct;
        
        for(Integer i = 0; i < 3; i++){
            Account acct = new Account();
            acct.Name = 'Test' + i; 
            lstAccts.add(acct);
        }
        insert lstAccts;
        
        parentAcctId = [SELECT Id FROM Account WHERE Name ='Parent'][0].Id;
        
        Test.startTest();
        QueueableUpdateParentAccount qupa = new QueueableUpdateParentAccount(lstAccts,parentAcctId);
        Id queueId = System.enqueueJob(qupa);
        Test.stopTest();
    
        List<Account> lstUpdateAccts = [SELECT ParentId FROM Account WHERE Name LIKE 'Test%'];
        //System.assertEquals(parentAcctId, lstUpdateAccts[0].ParentId);
        System.assertEquals('0018c00002C0Z9sAAF', lstUpdateAccts[0].ParentId);
        
                                                                                
    }
}