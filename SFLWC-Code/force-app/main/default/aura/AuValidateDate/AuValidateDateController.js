({
	dateUpdate : function(component, event, helper) {
		var today = new Date();
        
        var dd = today.getDate();
        var mm = today.getMonth()+1;
        var yyyy = today.getFullYear();
        
        // Format the date as mm-dd-yyyy
        if(dd < 10){
            dd = "0" + dd;
        }
        
        // Format the date as yyyy-mm-dd 
        if(mm < 10){
            mm = "0" + mm;
        }
        
        var todayFormattedDate = yyyy +'-'+ mm +'-'+ dd;
        
        //alert(component.get("v.inpDate"));
        console.log(component.get("v.inpDate"));
        
        if(component.get("v.inpDate") != '' && component.get("v.inpDate") < todayFormattedDate){
            component.set("v.dateValidationError" , true);
        } else {
            component.set("v.dateValidationError" , false);
        }
	},
    
    submit : function(component,event,helper){
      // Read the 'dateValidationError' attribute value
        var isDateError = component.get("v.dateValidationError");
        
        if(isDateError != true){
            alert('Submission is completed');
        }
    }
    
})