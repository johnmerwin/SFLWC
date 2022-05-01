({
	doInit : function(component, event, helper) {
		var action = component.get("c.getAccounts");
        // Call the Apex method above
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                // Pass the account list returned into the lstAccts
                // variable declared in the component  
                component.set("v.lstAccts", response.getReturnValue());
            } else {
                console.log('Failure');
            }
        });
        
        $A.enqueueAction(action);
	}
})