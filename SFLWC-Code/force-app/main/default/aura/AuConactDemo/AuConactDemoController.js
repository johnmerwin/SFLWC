({
	doInit : function(component, event, helper) {
        // Call the Apex method getContacts() here
        var action = component.get("c.getContacts");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            //console.log(state);
            if(state === "SUCCESS") {
                component.set("v.lstContacts", response.getReturnValue());
            }
        });
		$A.enqueueAction(action);
	}
})