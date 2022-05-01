public class RelatedRecords {
    
    public static void insertRelatedRecord() {
        // Create an Account record first
        Account acct = new Account();
        acct.Name = 'Harry Singh Inc.';
        acct.Phone = '7324060727';
        insert acct;
        
        // Create an associated Contact record for
        // this account
        Id acctId = acct.Id;
        Contact con = new Contact();
        con.FirstName = 'Harry';
        con.LastName = 'Singh';
        con.AccountId = acct.Id;
        con.Phone = '7324060728';
        insert con;
    }
    
    public static void updateRelatedRecord() {
        Account acct = [SELECT Id, Name FROM Account WHERE Name = 'Harry Singh Inc.'];
        Contact con = [SELECT Id, LastName FROM Contact WHERE Contact.AccountId = :acct.Id];
        con.LastName = 'Sethi';
        update con;
    }
    
    public static void createOppForAccount() {
        Account acct = [SELECT Id, Name FROM Account WHERE Name = 'Harry Singh Inc.'];
        
        Opportunity opp = new Opportunity();
        opp.AccountId = acct.Id;
        opp.Name = 'Laptops Replacement';
        opp.StageName = 'Prospecting';
        opp.Amount = 100000;
        opp.CloseDate = date.parse('04/30/2022');
       
        insert opp;
        
    }

}