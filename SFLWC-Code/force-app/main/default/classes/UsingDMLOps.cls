public class UsingDMLOps {
    
    public static void dmlOps(){
        Account acct = new Account();
        acct.Name = 'Test Account - 01';
        acct.Phone = '2026231111';
        insert acct;
        
        Id acctId;
        acctId = acct.Id;
        acct = [SELECT Id, Name FROM Account WHERE Id = :acctId];
        acct.Name = acct.Name + ' (Updated)';
        update acct;
        
    }
    
    public static void dmlOpsWithList(){
        List<account> lstAcct = new List<Account>();
        
        Account acct01 = new Account();
        acct01.Name = 'Test Account - 02';
        acct01.Phone = '2026231111';
        
        Account acct02 = new Account();
        acct02.Name = 'Test Account - 03';
        acct02.Phone = '2026231111';
       
        lstAcct.add(acct01);
        lstAcct.add(acct02);
       
        // Instead od 2 inserts, we can have only one
        // insert and not hit the governor limits
        insert lstAcct;
        
    }
    public static void insertRelatedRecord(){
        // First we will create an Account record
        // get its Id and then use it to create a
        // Contact record
        
        Account acct = new Account();
        Contact con = new Contact();
        
        acct.Name = 'Test Account - 04';
        acct.Phone = '2026231153';
        insert acct;
        
        // Now that we have created an Account record,
        // we will proceed to create a Contact record
        // for it
        Id acctId = acct.Id;
        con.AccountId = acctId;
        con.LastName = 'Gates';
        con.FirstName = 'Bill';
        insert con;
    }
    
    public static void updateParentRecord(){
        Contact con = [Select Id, LastName, FirstName, Phone, Account.Phone FROM Contact
                      WHERE LastName = 'Gates' AND FirstName = 'Bill'];
        
        con.Phone = '2026233300';
        con.Account.Phone = '2026232720';
        
        update con;
        // Not how we reference the parent object
        update con.Account;
        
    }
    public static void upsertRecords(){
        // Upserting  upating and inserting records
        // in one go
   		
        List<Account> lstAcct = new List<Account>();
        
        // This record is an existing one
        Account acct01 = [SELECT Name, Phone FROM Account 
                          WHERE Name = 'Test Account - 04' LIMIT 1];
        acct01.Phone = '2026230000';
        
        // This is a new record
        Account acct02 = new Account(Name = 'Test Account - 05', Phone = '2026233350');
        
        lstAcct.add(acct01);
        lstAcct.add(acct02);        
        
        // The first record wiil be updated with anew phone #
        // The second record will be created
        upsert lstAcct;
    }
    
    public static void mergeRecords(){
        Account acctMaster = [SELECT Name, Phone FROM Account 
                              WHERE Name = 'Test Account - 05' LIMIT 1];
        // Before merging acctMaster did not have a 
        // related Contact record
        
        // This account has a related Contact record. After merging
        // this Contact record will be related with 'Test Account - 05'
        // 'Test Account - 04' Account record will be deleted
        
        Account acctToMerge = [SELECT Name, Phone FROM Account 
                              WHERE Name = 'Test Account - 04' LIMIT 1];
        
        merge acctMaster acctToMerge;
    }

    public static void undeleteRecords(){
        // This account was deleted previously. Now we will 
        // undelete it. ALL ROWS clause needs to be included
        // when undeleting a record so that the Recycle Bin
        // can be accessed
        Account acctDeleted = [SELECT Name, Phone FROM Account 
                               WHERE Name = 'Test Account - 04' LIMIT 1 ALL ROWS];
        undelete acctDeleted;
        // If successfully undeleted then we will see
        // this record in the Account object
    }
}