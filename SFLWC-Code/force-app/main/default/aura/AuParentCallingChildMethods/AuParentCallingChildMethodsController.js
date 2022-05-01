({
    handleShow : function(component, event, helper) {
        // The show()is the name of the method we have used
        // in the child aura component.
        component.find("messages").show("Reservation confirmed!")
    },
    
    handleError : function(component, event, helper) {
        component.find("messages").error("Sorry, we ran into an issue.")
    },   
    
})