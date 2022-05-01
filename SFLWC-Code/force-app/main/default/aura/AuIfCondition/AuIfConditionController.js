({
    clickAction : function(component, event, helper) {
        
        var inpText = component.find("inpCmp");
        var value = inpText.get("v.value");
        
        if(!isNaN(value)){
            component.set("v.flagHeader", true);
            component.set("v.notANumber", false);
            if(value >= 50){
                component.set("v.flag", true);
            } else {
                component.set("v.flag", false);
            }
        } else {
            component.set("v.flagHeader", false);
            component.set("v.notANumber", true);
        }
    }
})