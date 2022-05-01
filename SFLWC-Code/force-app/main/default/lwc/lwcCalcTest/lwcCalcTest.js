import { LightningElement, track } from 'lwc';

export default class LwcCalcTest extends LightningElement {
    firstNumber = 0;
    secondNumber = 0;
    result = 0;
    // The "result" property will be passed to the child component
    // The name of the property in the child component must be the
    // "result" with an @api decorator

    handleChange(event) {
        if (event.target.name === "num01") {
            this.firstNumber = event.target.value;
        }
        if (event.target.name === "num02") {
            this.secondNumber = event.target.value;
        }
        this.result = parseInt(this.firstNumber) + parseInt(this.secondNumber);
    }

}