import { LightningElement } from 'lwc';

export default class LwcGetterDemo extends LightningElement {
    title = 'Learn to use getter in LWC JavaScript';
    selectedBtn = 'OFF';

    //This is how we create a getter method in JS

    get makeUpperCase() {
        return this.title.toUpperCase();
    }

    // Create another getter method to set the CSS class
    // for the box
    get boxClass() {
        return this.selectedBtn === 'OFF' ? 'box red' : 'box green';
    }

    handleClick(event) {
        this.selectedBtn = event.currentTarget.innerText;
    }
}