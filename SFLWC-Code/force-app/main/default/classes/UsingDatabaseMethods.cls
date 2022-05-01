public class UsingDatabaseMethods {

    public static void databaseInsert(){
        List<Contact> lstCon = new List<Contact>{ 
            new Contact(FirstName = 'Martha Lucia', LastName = 'Gutierrez'),
            new Contact(FirstName = 'Leslie', LastName = 'Harper'),
            new Contact()
            };
        
        // Allow partial inserts. The first two contacts will be 
        // inserted. The third one will fail as no values are supplied.
        Database.SaveResult[] dbResults = Database.insert(lstCon, false);
        
        for(Database.SaveResult sr: dbResults) {
            if(sr.isSuccess()) {
                System.debug('Record successfully inserted => ' + sr.getId());
            } 
            else {
                for(Database.Error err: sr.getErrors()) {
                    System.debug('The following errors occured during the insert operation');
                    System.debug(err.getStatusCode() + ' => ' + err.getMessage());
                    System.debug('Fields affected by this error => ' + err.getFields());
                }
            }
        }
    }
}