({
    // Step #3 Fire the event
    fireComponentEvent : function(component, event, helper) {
        
        var componentEvent = component.getEvent("cmpEvent");
        var msgStr = component.get("v.messageStr");
        
        var today = new Date();
        var currenTime = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        
        msgStr = $A.util.isEmpty(msgStr) ? "No Message": msgStr;
        // Set the parameters in the component and fire
        // the event. These are the attributes we declared
        // in the event (Step #1)
        
        componentEvent.setParams({
            "message" : msgStr,
            "label" : currenTime
        });
        
        componentEvent.fire();
    }
})