({
	handleComponentEvent : function(component, event, helper) {
		
        // Step #4 Handle the event
        var msg = event.getParam("message");
        var label = event.getParam("label");
        
        component.set("v.msgFromNotifier", msg);
        component.set("v.lblFromNotifier", label);
        
        var count = parseInt(component.get("v.eventCount")+1);
        component.set("v.eventCount", count);
	}
})