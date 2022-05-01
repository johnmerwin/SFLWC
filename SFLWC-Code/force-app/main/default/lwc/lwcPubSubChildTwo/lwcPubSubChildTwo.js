import { LightningElement, track } from 'lwc';
import pubsub from 'c/lwcPubSub';

export default class LwcPubSubChildTwo extends LightningElement {
    // I need to figure this out. I don't know what is
    // going on here

    @track message;
    connectedCallback() {
        this.callsubscriber();
    }

    callsubscriber() {
        pubsub.subscribe('sayHello', this.subscriberCallback)
    }

    subscriberCallback(event) {
        //this.message = { event };
        console.log(typeof event);
    }
}