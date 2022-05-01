import { LightningElement } from 'lwc';
import pubsub from 'c/lwcPubSub';

export default class LwcPubSubChildOne extends LightningElement {
    clickHandler(event) {
        // What does this do?
        this.eventPublisher('Hello From Child One');
    }
    eventPublisher(data) {
        pubsub.publish('sayHello', data)
    }
}