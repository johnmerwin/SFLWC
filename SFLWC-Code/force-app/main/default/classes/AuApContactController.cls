public class AuApContactController {

    @AuraEnabled
    public static List<Contact> getContacts(){
        List<Contact> lstContacts = [SELECT Id, LastName, FirstName FROM Contact 
                                     WHERE LastName != NULL ORDER BY LastName];
        return lstContacts;
    } 
}