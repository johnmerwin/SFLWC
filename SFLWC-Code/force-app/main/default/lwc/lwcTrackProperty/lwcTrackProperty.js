import { LightningElement, track } from 'lwc';

export default class LwcTrackProperty extends LightningElement {

    // We will be tracking this variable
    @track greetings;

    handleGreetingsChange(event) {
        this.greetings = event.target.value;
    }

}