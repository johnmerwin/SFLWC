@RestResource(urlMapping='/AccountRecord/*')
global with sharing class AccountServiceRest {
    // with sharing  if we want the sharing rules
    // to be respected.
    // @RestResource(urlMapping='/AccountRecord/*')
    // is necessary if we want to expose our class
    // as a REST class.
    
    @HttpGet
    global static void getAccountById(){
        String jsonString;
        String accountId = RestContext.request.params.get('accountId');
        // accountId is the parameter that is sent through the URL
        
        Account acctObj = [SELECT Id, Name FROM Account WHERE Id = :accountId];
        jsonString = json.serialize(acctObj);
        RestContext.response.addHeader('Content-type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(jsonString);
    }
}