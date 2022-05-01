public class UsingMaps {
    // Maps use a key-value pair. The key needs to be 
    // unique, whereas the value can have duplicates 
    
    
    public static void putMethod(){
        Map<Integer, String> isMap = new Map<Integer, String>();
        isMap.put(1, 'John');
        isMap.put(2, 'Leslie');
        System.debug('isMap contains => ' + isMap);
        
        // John will be overwritten with Martha
        isMap.put(1, 'Martha');
        System.debug('isMap now contains => ' + isMap);
        
    }
    
    public static void putAllMethod(){
        Map<Integer, String> isMapFirst = new Map<Integer, String>();
        Map<Integer, String> isMapSecond = new Map<Integer, String>();
        Map<Id, Account> isMapAccount = new Map<Id, Account>();
        List<Account> lstAcct = [SELECT Name FROM Account LIMIT 3]; 
        
        isMapFirst.put(1, 'John');
        isMapFirst.put(2, 'Leslie');
        System.debug('isMapFirst contains => ' + isMapFirst);
        
        isMapSecond.put(3, 'Harry');
        System.debug('isMapSecond before putAll() contains => ' + isMapSecond);
        isMapSecond.putAll(isMapFirst);
        System.debug('isMapSecond after putAll() contains => ' + isMapSecond);
        System.debug('The size of isMapSecond => ' + isMapSecond.size());
        
        // Using putAll() to put Account Ids and Names in isMapAccount
        isMapAccount.putAll(lstAcct);
        System.debug('isMapAccount after putAll() contains => ' + isMapAccount);
    }
}