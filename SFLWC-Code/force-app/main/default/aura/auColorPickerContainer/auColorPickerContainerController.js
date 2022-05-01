({
    setTextColor: function (component, event, helper) {
        // 'colorCode' is the color code that we used as a parameter
        // in the event that we dispatched in the LWC component

        component.set("v.colorPickerText", event.getParam('colorCode'));

    }
})