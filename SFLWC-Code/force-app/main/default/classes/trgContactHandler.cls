public class trgContactHandler {

    public static void sendEmailNotification(List<Contact> lstNew){
        List<Messaging.Email> lstEmail = new List<Messaging.Email>();
        
        for(Contact con: lstNew) {
            if(con.Email != null) {
                 
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{con.Email};
                    
                emailMsg.setToAddresses(toAddress);
                String emailSub = 'Welcome ' + con.FirstName;
                emailMsg.setSubject(emailSub);
                String senderDispName = 'This is John';
                emailMsg.setSenderDisplayName(senderDispName);
                
 				String emailBody = 'Welcome aboard ' + con.FirstName + '<br><br/>' +
                    'Your Salesforce journey begins today. We wish you the best <br><br/>' +
                    'Regards <br><br/>' + 'The Salesforce Team';
                emailMsg.setHtmlBody(emailBody);
                
                lstEmail.add(emailMsg);
             }
        }
        if(!lstEmail.isEmpty()) {
            Messaging.sendEmail(lstEmail);
        }
    }
}