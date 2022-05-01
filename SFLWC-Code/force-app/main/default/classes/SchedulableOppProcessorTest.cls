@isTest
public class SchedulableOppProcessorTest {
    @isTest
    public static void testOppLeadSource() {
        List<Opportunity> lstOpps = new List<Opportunity>();
        
        for(Integer i = 0; i < 10; i++){
            Opportunity opp = new Opportunity();
            
            opp.Name = 'Schedulable' + i;
            opp.CloseDate = System.today();
            opp.LeadSource = 'Web';
            opp.Amount = 50000;
            opp.StageName = 'Prospecting';
            opp.Type = 'New Customer';
            
            lstOpps.add(opp);
        }
        insert lstOpps;
        
        // The real test begins here
       
        Test.startTest();
        SchedulableOppProcessor sop = new SchedulableOppProcessor();
        // Seconds, Minutes, Hours, DayofMonth, Month, DayofWeek, Year
        String cronExp ='0 0 0 ? * * *';
        String jobId = System.schedule('Update Lead Source', cronExp, sop);
        Test.stopTest();
        
        List<Opportunity> lstOppsUpdated = [SELECT LeadSource FROM Opportunity 
                                           WHERE LeadSource = 'Other'];
        System.assertEquals(10, lstOppsUpdated.size());
        
    }

}