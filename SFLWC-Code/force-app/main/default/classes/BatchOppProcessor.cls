public class BatchOppProcessor implements Database.Batchable<sObject>, Database.stateful {
    public Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, LeadSource FROM Opportunity]);
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> lstOpps){
        for (Opportunity opp: lstOpps){
            if (opp.LeadSource == null){
                opp.LeadSource = 'Web';
            }
        }
        update lstOpps;
        recordCount += lstOpps.size();
    }
    
    public void finish(Database.BatchableContext bc){
       System.debug('Total number of records processed => ' + recordCount); 
    }

}