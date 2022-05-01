({
    handleError : function(component, event, helper) {
        var hasPerm = false;
        
        try
        {
            if(!hasPerm){
                throw new Error("We will handle this error this time.");
            }
        }
        catch(e){
            $A.createComponents([
                [
                    "ui:message", {
                        "title" : "Sample error message",
                        "severity" :"error"
                    }], 
                [
                    "ui:outputText",   {
                        "value" : e.message
                    }]
            ],
                               
                               function(components, status, errorMessage) {
                                   if(status === "SUCCESS") {
                                       var message = components[0];
                                       var outputText = components[1];
                                       
                                       message.set("v.body", outputText);
                                       var msgDiv = component.find("msgDiv");
                                       msgDiv.set("v.body", message);
                                       
                                   } else if(status === "INCOMPLETE") {
                                       console.log("Incomplete");
                                   } else if(status === "ERROR"){
                                       console.log("Error => " + errMessage);
                                   }
                               }
                              );
        } // catch
    } // handleError
})