global class SchedulableOppProcessor implements Schedulable {
    
    global static void execute(SchedulableContext sc) {
        List<Opportunity> lstOpps = [SELECT Id, LeadSource FROM Opportunity 
                                            WHERE LeadSource = 'Web'];
        for(Opportunity opp: lstOpps){
            opp.LeadSource = 'Other';
        }
        update lstOpps;
    }

}