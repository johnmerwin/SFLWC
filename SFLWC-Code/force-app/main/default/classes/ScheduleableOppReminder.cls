global class ScheduleableOppReminder implements Schedulable {
    
    global static void execute(SchedulableContext sc){
        List<Opportunity> lstOpps = [SELECT Id, Name, OwnerId FROM Opportunity
                                     WHERE IsClosed = False AND CloseDate < TODAY
        							];
        TaskUtils.remindOppOwners(lstOpps);
    }

}