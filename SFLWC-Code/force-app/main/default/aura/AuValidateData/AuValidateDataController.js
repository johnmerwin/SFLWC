({
    doAction : function(component, event, helper) {
        var inpText = component.find("auId");
        var value = inpText.get("v.value");
        //alert(value);
        
        if(isNaN(value)){
            inpText.set("v.errors", [{message: "Input is not a number => " + value}]);
        } else {
            inpText.set("v.errors",null);
        }
    }
})