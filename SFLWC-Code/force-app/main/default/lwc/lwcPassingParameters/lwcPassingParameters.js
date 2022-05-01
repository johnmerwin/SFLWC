import { LightningElement, track } from 'lwc';
import getSum from '@salesforce/apex/AddTwoNumbers.getSum';

export default class LwcPassingParameters extends LightningElement {
    @track firstNum
    @track secondNum
    @track sum
    @track errors
    @track errorOccurred = false;

    handleClick() {
        this.errorOccurred = false;
        // Passing parameters to the Apex method imported above
        getSum(
            {
                firstNum: this.firstNum,
                secondNum: this.secondNum
            }
        )
            .then(result => {
                this.sum = result;
            })
            .catch(error => {
                this.errors = error;
                this.errorOccurred = true;
            })
    }

    handleChange(event) {
        if (event.target.name == "num01") {
            this.firstNum = event.target.value;
        }
        if (event.target.name == "num02") {
            this.secondNum = event.target.value;
        }
    }

}