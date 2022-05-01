@isTest
public class TestTemperature {
	// Test class for Temperature class
	
    @isTest
    private static void warmTemperature(){
        Decimal result = Temperature.convFhToCe(70); 
        //System.debug('Result => ' + result);
        
        // This will fail, because the expected value
        // must be 21.11 and not 21.15
        System.assertEquals(21.11, result);
    }
    
    @isTest
    private static void coldTemperature(){
        Decimal result = Temperature.convFhToCe(30); 
        //System.debug('Result => ' + result);
        
        // This will fail, because the expected value
        // must be 21.11
        System.assertEquals(-1.11, result);
    }    
      
}