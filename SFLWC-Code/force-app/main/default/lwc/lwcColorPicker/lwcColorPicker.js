import { LightningElement } from 'lwc';

export default class LwcColorPicker extends LightningElement {

    handleColorChange(event) {
        const colorCode = event.target.value;
        // Create a custom event whose name is 'colorchange' and  pass 
        // the value of the color code as a parameter

        const colorCodeEvent = new CustomEvent('colorchange', {
            detail: { colorCode }
        });
        this.dispatchEvent(colorCodeEvent);
    }
}