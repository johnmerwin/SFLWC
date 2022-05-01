public class LaunchContactAutoFlow {
    
       public static void getlastName() {
        Map<String, String> conRecId = new Map<String, String>();
        
        // recordId is the variable we have declared in the
        // flow that will accept the Opportunity Id
        
        conRecId.put('recordId', '0038c00002jwwHhAAI');
        
        // This is how we launch an autoflow from Apex
        
        Flow.Interview.Get_Contact_Last_Name_AutoFlow getConLastName = 
            new Flow.Interview.Get_Contact_Last_Name_AutoFlow(conRecId);
        
        getConLastName.start();
        String lastName = (String)getConLastName.getVariableValue('lastName');
        
        system.debug('Last Name => ' + lastName);
        
    }

}