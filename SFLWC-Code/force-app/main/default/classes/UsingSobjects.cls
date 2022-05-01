public class UsingSobjects {
    
    public static void useAccountObject() {
        Account acct = new Account();
        acct.Name = 'Apex Test Account';
        acct.Phone = '2026231153';
        acct.Website = 'www.apextest.com';
        
        System.debug('acct => ' + acct);
        
    }
    
    public static void useCustomObject() {
        // Note that Book is a custom object 
        Book__c book = new Book__c();
        book.Title__c = 'Man\'s search for meaning';
        book.Authors__c = 'Viktor Frankl';
        System.debug('book => ' + book);
    }
    
    public static void useSObject() {
        sObject obj;
        obj = new Account(Name = 'Apex Test Account', Phone = '2026231153', Website = 'www.apextest.com');
        // Typecast obj to Account
        Account acct = (Account)obj;
        
        System.debug('obj => ' + obj);
    }
    
    public static void listLoop() {
        List<Account> lstAcct = [SELECT Id, Name FROM Account LIMIT 5];
        Set<Id> acctIds = new Set<Id>();
        Integer lstSize = 0;
        
        System.debug('List size => ' + lstAcct.size());
        lstSize = lstAcct.size();
        
        if (lstSize > 0) {
            for(Account tmpAcct: lstAcct) {
                // System.debug('Id = ' + tmpAcct.Id + ' Name = ' + tmpAcct.Name);
                // Store the Ids in a set
                acctIds.add(tmpAcct.Id);
            } 
        }
        if (lstSize > 0) {
            System.debug('Set of Acct Ids => ' + acctIds);
        }
        
    }
    
    public static void mapLoop() {
        List<Account> lstAcct = [SELECT Id, Name FROM Account LIMIT 5];
        Map<Id, Account> mapAcct = new Map<Id, Account>();
        Set<Id> setIds = new Set<Id>();
        Integer mapSize = 0;
        
        // We are putting the contents of lstAcct into
        // mapAcct
        mapAcct.putAll(lstAcct);
        
        System.debug('Map size => ' + mapAcct.size());
        mapSize = mapAcct.size();
        
        if (mapSize > 0) {
            for(Id key: mapAcct.keySet()){  
                // Loop throuh the keys of the map
                // Store the Ids in a set
                setIds.add(key);
            } 
        }
        if (mapSize > 0) {
            System.debug('Set of Acct Ids => ' + setIds);
        }
        
    }
}