trigger trgAccount01 on Account (before insert, after insert, before update, after update) {
    
    if((Trigger.isInsert) && (Trigger.isBefore)){
        // We are calling the code in a Helper class
        // to insert the records.
        trgAccount01Handler.updateRating(Trigger.New);
    }
    
    if((Trigger.isInsert) && (Trigger.isAfter)){
        // We are calling the code in a Helper class
        // to insert the records.
        trgAccount01Handler.createRelatedOpp(Trigger.New);
    }
    
    if((Trigger.isUpdate) && (Trigger.isBefore)){
        // We are calling the code in a Helper class
        // to insert the records.
        trgAccount01Handler.updateAccountDesc(Trigger.New, Trigger.OldMap);
    }
    
    if((Trigger.isUpdate) && (Trigger.isAfter)){
        // We are calling the code in a Helper class
        // to insert the records.
        trgAccount01Handler.updatePhoneInOpp(Trigger.New, Trigger.OldMap);
    }
}