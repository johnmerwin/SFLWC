public class EventUtility {
    
    public static String eventPriority(String eventStatusCode){
        String result;
        
        If(String.isBlank(eventStatusCode)|| eventStatusCode.length() <> 2) {
            return null;
        }
        if (eventStatusCode == 'CA') {
            result = 'High';
        } 
        else {
            result = 'Medium';
        }
        return result;
        
        
    }
}