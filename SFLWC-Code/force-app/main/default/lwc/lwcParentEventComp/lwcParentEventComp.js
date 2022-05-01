import { LightningElement } from 'lwc';

export default class LwcParentEventComp extends LightningElement {
    score = 10;

    changeHandler(event) {
        //this.score = event.target.value;
        //this[event.target.name] = event.target.value;
        this[event.target.name] = event.target.value <= 100 ? event.target.value : 100;
        console.log(this.score);
    }
}