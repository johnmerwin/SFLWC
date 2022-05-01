public class trgProjectsHandler {
    
    public static void checkProjectStatus(List<Project__c> lstProjects) {
        for(Project__c tmpProj: lstProjects){
            if(tmpProj.Is_Active__c == true){
                tmpProj.addError('An active project cannot be deleted');
            }
        }
    }
    
    public static void updateProjectCount(List<Project__c> lstOldProjects, String strDML) {
        // Update the Project_Count__c field on the Account
        // object when a project is inserted, deleted or undeleted
        
        // For very project that is inserted or undeleted increment
        // the Project_Count__ field by 1
        // For very project that is deleted decrement
        // the Project_Count__ field by 1
        
        Integer intCount;
        
        switch on strDML {
            when 'INSERT', 'UNDELETE' {		 
                intCount = 1;
            }	
            when 'DELETE' {		 
                intCount = -1;
            }
        }
        
        List<Project__c> lstProjectsWithAccounts = new List<Project__c>();
        Set<Id> setAcctIds = new Set<Id>();
        Map<Id, Account> mapIdAcct = new Map<Id, Account>();
        Map<Id, Decimal> mapIdToTotalCount = new Map<Id, Decimal>();
        
        for(Project__c tmpProject :lstOldProjects){
            // These are projects associated with accounts
            // Store the  Account Ids in the set. These will
            // be used to query the accounts later 
            
            if(tmpProject.Account__c != null){
                setAcctIds.add(tmpProject.Account__c);
                lstProjectsWithAccounts.add(tmpProject);
            }
        }
        
        if(!setAcctIds.isEmpty()){
            // Fetch all the accounts that are associated with
            // projects
            mapIdAcct = new Map<Id, Account>([SELECT Id, Project_Count__c FROM Account
                                              WHERE Id IN :setAcctIds]);
        }
        
        /*
        System.debug('setAcctIds => ' + setAcctIds);
        System.debug('mapIdAcct => ' + mapIdAcct);
        System.debug('lstProjects => ' + lstProjects);
       */
        
        if(!lstProjectsWithAccounts.isEmpty()) {
            for(Project__c tmpProject :lstProjectsWithAccounts) {
                if(mapIdToTotalCount.containsKey(tmpProject.Account__c)){
                    Decimal count = mapIdToTotalCount.get(tmpProject.Account__c) + intCount;  
                    mapIdToTotalCount.put(tmpProject.Account__c, count);
                }
                else {
                    if(mapIdAcct.get(tmpProject.Account__c).Project_Count__c == null){
                        //System.debug('Project_Count__c is null');
                    	mapIdToTotalCount.put(tmpProject.Account__c, 0);
                    }
                    else {
                     	mapIdToTotalCount.put(tmpProject.Account__c, 
                                           mapIdAcct.get(tmpProject.Account__c).Project_Count__c + intCount);
                       
                    }
                    /*
                    System.debug('tmpProject.Account__c => ' + tmpProject.Account__c);
                    System.debug('mapIdAcct.get(tmpProject.Account__c) => ' + mapIdAcct.get(tmpProject.Account__c));
					*/	
                }
            }  
        }
 
        List<account> lstAcctsToUpdate = new List<Account>();
        for(Id acctId: mapIdToTotalCount.keySet()){
            Account acct = new Account();
     
            acct.Id = acctId;
            acct.Project_Count__c = mapIdToTotalCount.get(acctId);
            
            lstAcctsToUpdate.add(acct);
        }
        
        if(!lstAcctsToUpdate.isEmpty()) {
            update lstAcctsToUpdate;
        }
    } 
    
    
    public static void updateProjectStatus(List<Project__c> lstProjects){
        List<Project__c> lstProjectsUndelete =  new List<Project__c>();
        Set<Id> setAcctIds = new Set<Id>();
        
        for(Project__c tmpProj: lstProjects){
            Project__c proj = new Project__c();
            
            // When undeleting the project record
            // set IsActive field to true. If a project
            // is active, it cannot be deleted
            
            proj.Is_Active__c = true;
            proj.Id = tmpProj.Id;
            
            lstProjectsUndelete.add(proj);
            if(tmpProj.Account__c != null){
                // This project is associated with an Account
                setAcctIds.add(tmpProj.Account__c);
            }
        }
        
        System.debug('setAcctIds => ' + setAcctIds);
        if(!setAcctIds.isEmpty()){
            Map<Id,Account> mapIdAccts = new Map<Id,Account>([SELECT Id, Project_Count__c FROM Account
                                                              WHERE Id IN :setAcctIds]);
        }
        
        if(!lstProjectsUndelete.isEmpty()){
            
            // We are not using the undelete method. We are
            // just updating the list of the undeleted records
            update lstProjectsUndelete;
        } else {
            System.debug('lstProjectsUndelete is empty');
        }
    } 
}