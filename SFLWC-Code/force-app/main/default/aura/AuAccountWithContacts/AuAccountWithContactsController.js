({
	doInit : function(component, event, helper) {
		
        component.set("v.columns",[
            {label: "First Name", fieldName: "FirstName", type: "text"},
            {label: "Last Name", fieldName: "LastName", type: "text"},
            {label: "Email", fieldName: "Email", type: "email"},
            {label: "Phone", fieldName: "Phone", type: "phone"}
        ]);
       
 
        // Call the Apex method getContacts() here
        var action = component.get("c.getContacts");
       
        // Pass the account Id to the Apex method
        action.setParams({
            recordId: component.get("v.recordId")
        });
                       
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
                component.set("v.contacts", response.getReturnValue());
            }
        });
		$A.enqueueAction(action);
	}
})