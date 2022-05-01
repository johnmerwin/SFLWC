public class LaunchAutoFlow {
    // /flow/Get_Opp_Details_Autoflow
    
    public static void getStageName() {
        Map<String, Object> oppRecId = new Map<String, Object>();
        
        // recordId is the variable we have declared in the
        // flow that will accept the Opportunity Id
        
        oppRecId.put('recordId', '0068c00000pFHs5AAG');
        
        // This is how we launch an autoflow from Apex
        
        Flow.Interview.Get_Opp_Details_Autoflow getOppStage = 
            new Flow.Interview.Get_Opp_Details_Autoflow(oppRecId);
        
        getOppStage.start();
        String oppStage = (String)getOppStage.getVariableValue('oppStage');
        
        system.debug('Opp Stage value returned => ' + oppStage);
        
    }
    
    
}