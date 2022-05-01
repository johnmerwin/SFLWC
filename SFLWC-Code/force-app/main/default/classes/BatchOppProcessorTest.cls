@isTest
public class BatchOppProcessorTest {
    
    @isTest
    private static void testBatchOppProcessor() {
        List<Opportunity> lstOpps = new List<Opportunity>();
        
        for(Integer i = 0; i < 10; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Batch Opp 0' + i;
            opp.CloseDate = System.today();
            opp.StageName = 'Prospecting';
            
            lstOpps.add(opp);
        }
        insert lstOpps;
        
        Test.startTest();
      
        // Instantiate the Batch class we have created.
        // Note that the Opportunities we have created above
        // will be passed implicity to the start() method
        // in the batch class.
        
        BatchOppProcessor bop = new BatchOppProcessor();
        Id batchId = Database.executeBatch(bop);
        Test.stopTest();
        
        List<Opportunity> lstUpdatedOpps = [SELECT LeadSource FROM Opportunity];
        System.assertEquals('Web', lstUpdatedOpps[0].LeadSource);
        System.assertEquals('Web', lstUpdatedOpps[2].LeadSource);
    }
    
}