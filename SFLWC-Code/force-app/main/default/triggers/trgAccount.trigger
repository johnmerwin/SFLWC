trigger trgAccount on Account (before insert, after insert, before update, after update) {
    if((Trigger.isInsert) &&(Trigger.isBefore)) {
        TrgAccountHandler.copyBillingToShipping(Trigger.New);
    }
    
    if((Trigger.isUpdate) &&(Trigger.isBefore)) {
        TrgAccountHandler.copyBillingToShipping(Trigger.New);
    }
    
}