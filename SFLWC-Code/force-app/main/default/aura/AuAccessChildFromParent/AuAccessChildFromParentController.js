({
	showConfirmMessage : function(component, event, helper) {
        helper.showMessageHelper(component, event, "confirm")
	},
    
    showErrorMessage : function(component, event, helper) {
		helper.showMessageHelper(component, event, "error")
	}
})