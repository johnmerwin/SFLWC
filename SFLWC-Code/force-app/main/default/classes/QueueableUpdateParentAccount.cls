public class QueueableUpdateParentAccount implements Queueable {
    
    private List<Account> acctsToUpdate = new List<Account>();
    private Id parentAcctId;
    
    public QueueableUpdateParentAccount(List<Account> lstAccts, Id acctId) {
       // This is the constructor
       this.acctsToUpdate = lstAccts;
       this.parentAcctId = acctId;
    }
    
    public void execute(QueueableContext context) {
        for(Account acct: acctsToUpdate) {
            acct.ParentId = parentAcctId;
        }
        update acctsToUpdate;
    }
	/*
	    This is how we will test the code above in Debug window 
        
		List<Account> lstAccts = [SELECT Id, Name, BillingState FROM Account WHERE BillingState = 'CA'];
        Id parentAcctId = [SELECT Id FROM Account WHERE Name =
        'Harry Singh Inc.'][0].Id;
        System.debug('parentAcctId => ' + parentAcctId);
        
        QueueableUpdateParentAccount qupa = new QueueableUpdateParentAccount(lstAccts,parentAcctId);
        Id queueId = System.enqueueJob(qupa);
        System.debug('queueId => ' + queueId);
	*/
}