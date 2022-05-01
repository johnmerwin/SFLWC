({
    fireAppEvent : function(component, event, helper) {
        // Fire the event. Not how the application event is called
        
        var appEvent =$A.get("e.c:AuAppEvent");
        appEvent.setParams({
            "message": "Message from App Event Notifier" 
        });
        appEvent.fire();
    }
})