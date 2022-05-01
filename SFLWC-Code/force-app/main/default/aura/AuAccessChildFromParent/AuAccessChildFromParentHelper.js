({
	showMessageHelper: function(component, event, severity) {
		var messages = event.getParam("arguments");
        
        var displayMessage = '';
       
        if(messages) {
            displayMessage = messages.message;
        }
        
        var messagePanel = component.find("messages");
        $A.createComponents([
            [
                "ui:message",
                {
                    "title" : severity.toUpperCase(),
                    "severity": severity,
                    "closable" : true
                }
            ],
            
            [
                "ui:outputText",
                {
                    "value" :displayMessage
                }
            ]
            ],
                            
            function(components, status, statusMessageList) {
                if(status ==="SUCCESS") {
                    var messageComp = components[0];
                    var outputComp = components[1];
                    messageComp.set("v.body", outputComp);
                    messagePanel.set("v.body", messageComp);
                }
            }
            
        );
	}
})