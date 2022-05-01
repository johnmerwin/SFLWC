public class DataTypesDemo {
    public DataTypesDemo() {
        System.debug('I am in the constructor of DataTypesDemo class');
    }
    
    public static Integer addTwoNumbers(){
        Integer sum;
        sum = 5 + 10;
        return sum;
    }
    
    public static void accountRecord(){
        Account acct = new Account();
        acct.Name = 'Test - 1';
        acct.Phone = '202623111';
        System.debug('Account Details: ' + acct);
    }

    public static void createList(){
        List<String> strList = new List<String>();
        strList.add('John');
        strList.add('Merwin');
        System.debug('List: ' + strList);
    }
    
    public static void createMap(){
        Map<Integer,String> tmpMap = new Map<Integer, String>();
        tmpMap.put(1, 'John');
        tmpMap.put(2, 'Martha');
        System.debug('Map: ' + tmpMap);
    }  
    
    public static void fetchAccounts(){
        List<Account> lstAccounts = [SELECT Id, Name FROM Account LIMIT 5];
        for(Integer i = 0; i < lstAccounts.size(); i++){
            System.debug('Account Id = ' +  lstAccounts[i].Id + ' Name = ' + lstAccounts[i].Name);
        }
    }
}