public class UsingLists {
    
    public static void listMethod() {
        List<String> lstCountry = new List<String>();
        List<String> lstSecond = new List<String>();
        List<String> lstThird = new List<String>();
        Set<String> setCountry = new Set<String>();
        
        lstCountry.add('India');
        lstCountry.add('USA');
        // UK will be inseted at index 1 and USA will be 
        // pushed to index to
        lstCountry.add(1, 'UK');
        
  
        lstSecond.add('Germany');
        lstSecond.add('Holland');
        // Now we add all the elements of lstCountry 
        // to lstSecond         
        lstSecond.addAll(lstCountry);
        
        // Let's populate the set now
        setCountry.add('Sweden');
        setCountry.add('Norway');
        
        lstThird.add('Denmark');
        lstThird.add('Finland');
        // Now let's add the contents of the set to this list
        lstThird.addAll(setCountry);
        
        System.debug('lstCountry => ' + lstCountry);
        System.debug('lstCountry size => ' + lstCountry.size());
        
        System.debug('lstSecond => ' + lstSecond);
        System.debug('setCountry => ' + setCountry);
        System.debug('lstThird => ' + lstThird);
        
    }
    
    public static void cloneList() {
        
        List<String> lstFirst = new List<String>();
        List<String> lstSecond = new List<String>();
        
        lstFirst.add('Japan');
        lstFirst.add('South Korea');
        lstFirst.add('China');
        
        // We are cloning the first list here
        
        lstSecond = lstFirst.clone();
        
        System.debug('lstFirst => ' + lstFirst );
        System.debug('lstSecond => ' + lstSecond );
    }
    
    public static void containsElement(String countryName) {
        List<String> lstFirst = new List<String>();
        Boolean isThere;
        
        lstFirst.add('Japan');
        lstFirst.add('South Korea');
        lstFirst.add('China');
        
        isThere = lstFirst.contains(countryName);
        System.debug('Contains ' + countryName + ' => ' + isThere);
        
    }
    
    public static void accessAccounts() {
        // Store 5 accounts in a list
        List<Account> lstAccounts = [SELECT ID, Name FROM Account ORDER BY Name LIMIT 5];
        System.debug('lstAccounts => ' + lstAccounts);
    }
}