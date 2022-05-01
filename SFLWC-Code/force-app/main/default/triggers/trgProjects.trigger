trigger trgProjects on Project__c (after insert, before delete, after delete, after undelete) {
    
    if(Trigger.isInsert && Trigger.isAfter){
        trgProjectsHandler.updateProjectCount(Trigger.New, 'INSERT');
    }
    
    if(Trigger.isDelete && Trigger.isBefore){
        // We will always have the 'Old' trigger context as
        // we are working with existing records here.
        trgProjectsHandler.checkProjectStatus(Trigger.Old);
    }
    
    if(Trigger.isDelete && Trigger.isAfter){
        // We will always have the 'Old' trigger context as
        // we are working with existing records here.
        
        trgProjectsHandler.updateProjectCount(Trigger.Old, 'DELETE');
    }
    
    if(Trigger.isUndelete && Trigger.isAfter){
        // We will always have the 'New' trigger context as
        // we are working with new records here.
        
        //trgProjectsHandler.updateProjectStatus(Trigger.New);
        trgProjectsHandler.updateProjectCount(Trigger.New, 'UNDELETE');
    }
}