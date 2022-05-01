({
    doInit : function(component, event, helper) {
        // Reference the myName variable in the AuAttributes.cmp
        // file and set a value. The "v." before the variable name 
        // refers to the view
        component.set("v.myName", "Johnsito");
        
        // Set the variables in the Apex wrapper class here
        component.set("v.userData",
                      {
                          'tstString': 'James',
                          'tstInteger': 100
                      }
                     );
    }
})