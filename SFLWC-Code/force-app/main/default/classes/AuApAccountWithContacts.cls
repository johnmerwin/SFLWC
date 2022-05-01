public class AuApAccountWithContacts {
    
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){
        List<Contact> lstContacts = [SELECT Id, LastName, FirstName, Email, Phone FROM Contact 
                                     WHERE AccountId = :recordId ORDER BY LastName];
        return lstContacts;
    } 

}