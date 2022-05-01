({
	fetchAccounts : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set("v.lstAccts", response.getReturnValue());
            }
        });
		$A.enqueueAction(action);
		
	},
    
    handleChange : function(component, event, helper) {
        var comp = component.find("selDropdown");
        
        if(comp) {
            var value = comp.get("v.value");
            component.set("v.recordId", value);
        }
    }
})