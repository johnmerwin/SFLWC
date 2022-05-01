({
	methodCalledFromChild : function(component, event, helper) {
		var childComp = component.find("msg");
        component.set("v.valueFromChild",childComp.get("v.valueForParent") )
	}
})