public class TrgAccountHandler {
    
    public static void copyBillingToShipping(List<Account> lstAccts){
        
        for(Account tmpAcct: lstAccts){
            tmpAcct.ShippingStreet = tmpAcct.BillingStreet;
            tmpAcct.ShippingCity = tmpAcct.BillingCity;
            tmpAcct.ShippingState = tmpAcct.BillingState;
            tmpAcct.ShippingCountry = tmpAcct.BillingCountry;
        }
    }
}