@isTest
public class TestEventUtility {

    @isTest
    private static void testEvtStatusMedium(){
        String result;
        result = EventUtility.eventPriority('VA');
        System.assertEquals('Medium', result);
    }
    
    @isTest
    private static void testEvtStatusHigh(){
        String result;
        result = EventUtility.eventPriority('CA');
        System.assertEquals('High', result);
    }
    
    @isTest
    private static void testEvtStatusLength(){
        String result;
        result = EventUtility.eventPriority('VAT');
        System.assertEquals(null, result);
    }
    
    @isTest
    private static void testEvtStatusBlank(){
        String result;
        result = EventUtility.eventPriority('');
        System.assertEquals(null, result);
    }
}