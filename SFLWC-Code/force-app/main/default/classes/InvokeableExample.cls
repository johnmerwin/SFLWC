public class InvokeableExample {
	@InvocableMethod 
    
    public static void testInvocable() {
        // We will be calling this method from
        // Process Builder
        System.debug('This is an invocable method');
    }
    
}