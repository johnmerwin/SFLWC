trigger trgContact on Contact (after insert) {
    if(Trigger.isInsert && Trigger.isAfter) {      
        trgContactHandler.sendEmailNotification(Trigger.New);
    }
}