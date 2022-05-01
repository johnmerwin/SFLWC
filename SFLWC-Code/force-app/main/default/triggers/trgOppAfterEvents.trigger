trigger trgOppAfterEvents on Opportunity (after insert, after update, after delete) {
    
    if (Trigger.isInsert && Trigger.isAfter) {
        trgOppAfterEventsHandler.afterInsertRevenueUpdate(Trigger.New);
        trgOppAfterEventsHandler.afterInsertOppCountUpdate(Trigger.New);
    }
    
    if(Trigger.isUpdate && Trigger.isAfter) {
      trgOppAfterEventsHandler.afterUpdateRevenueUpdate(Trigger.New, Trigger.OldMap);  
    }
    
    if(Trigger.isDelete && Trigger.isAfter) {
        trgOppAfterEventsHandler.afterDeleteRevenueUpdate(Trigger.Old); 
    }
}