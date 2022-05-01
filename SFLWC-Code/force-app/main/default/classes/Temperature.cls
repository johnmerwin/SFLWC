public class Temperature {
    
    public static Decimal convFhToCe(Decimal fh){
        Decimal result;
        
        result = (Decimal)(fh-32)*(5.0/9.0);
        //System.debug('result in method => ' + result);
        return result.setScale(2);
    }
}