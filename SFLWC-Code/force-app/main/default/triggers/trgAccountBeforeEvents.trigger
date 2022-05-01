trigger trgAccountBeforeEvents on Account (before insert, before update, before delete) {

    if((Trigger.isInsert) && (Trigger.isBefore)){
        trgAccountBeforeEventsHandler.insertDescription(Trigger.New);
    }
    
    if((Trigger.isUpdate) && (Trigger.isBefore)){
        trgAccountBeforeEventsHandler.updateDescription(Trigger.New, Trigger.OldMap);
    }
    
    if((Trigger.isDelete) && (Trigger.isBefore)){
        trgAccountBeforeEventsHandler.deleteAccount(Trigger.Old);
    }
}