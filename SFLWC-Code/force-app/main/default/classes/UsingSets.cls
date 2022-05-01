public class UsingSets {
    
    public static void setMethods() {
        Set<String> setFirst= new Set<String>();
        Set<String> setSecond = new Set<String>();
        Set<String> setThird = new Set<String>();
        List<String> lstCountry = new List<String>();
        
        // Note that a set is an unordered collection of 
        // elements.
        // There are no duplicate elements in a set
        setFirst.add('India');
        setFirst.add('USA');
        System.debug('setFirst =>' + setFirst);
        
        setSecond.add('Germany');
        setSecond.add('France');
        System.debug('setSecond =>' + setSecond);
        
        System.debug('Adding setSecond to setFirst');
        setFirst.addAll(setSecond);
        System.debug('setSecond =>' + setFirst);
        
        lstCountry.add('India');
        lstCountry.add('Belgium');
        lstCountry.add('Austria');
        
        System.debug('-----------------------------');
        System.debug('lstCountry =>' + lstCountry);
        System.debug('Adding lstCountry to setFirst');
        setFirst.addAll(lstCountry);
        System.debug('setFirst =>' + setFirst);
        
    }
    
    public static void cloneSet() {
        Set<String> setFirst= new Set<String>();
        Set<String> setSecond = new Set<String>();
        
        setFirst.add('India');
        setFirst.add('USA');
        System.debug('setFirst =>' + setFirst);
        
        // Clone setFirst
        setSecond = setFirst.clone();
        System.debug('setSecond =>' + setSecond);
        
    }
    
    public static void checkContainsAll() {
        Set<String> setFirst= new Set<String>{'India', 'USA'};
        Set<String> setSecond = new Set<String>{'India', 'USA', 'Colombia'};
        
        Boolean containsAll;
        System.debug('setSecond =>' + setSecond);
        System.debug('setFirst =>' + setFirst);
        
        containsAll = setFirst.containsAll(setSecond);
        System.debug('Does setFirst contain all elements in setSecond? ' + containsAll);
    }
}