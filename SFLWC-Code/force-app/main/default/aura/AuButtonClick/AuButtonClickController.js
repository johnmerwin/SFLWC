({
    doInit : function(component, event, helper) {
        component.set("v.tstMessage01", "Init - 01");
        component.set("v.tstMessage02", "Init - 02");
    },
    
    handleButton : function(component, event, helper) {
        //component.set("v.tstMessage01", "John");
        
        // Identify the source of the event
        var btn = event.getSource();
        // Get the label of the button 
        var msg = btn.get("v.label");
        
        if(msg == "Button - 01"){
            component.set("v.tstMessage01", "You clicked on Button 1");  
        } 
        else if(msg == "Button - 02"){
            component.set("v.tstMessage02", "You clicked on Button 2");  
        } 
        
    },
    
    handleButton01 : function(component, event, helper) {
        component.set("v.tstMessage01", "John");
    },
    
    handleButton02 : function(component, event, helper) {
    component.set("v.tstMessage02", "Merwin");
}
 
 })