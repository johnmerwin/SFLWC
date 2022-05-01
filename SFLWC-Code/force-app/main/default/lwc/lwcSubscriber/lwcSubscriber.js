import { LightningElement, wire, track } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import pubsub from 'c/lwcPubSubRecipe';

export default class LwcSubscriber extends LightningElement {
    message;
    @wire(CurrentPageReference) pageRef;

    connectedCallback() {
        // Subscribe to the published event - messagesend
        pubsub.registerListener('messagesend', this.handlemessagesend, this)
    }

    handlemessagesend(publisherMessage) {
        this.message = publisherMessage;
    }

    disconnectedCallback() {
        pubsub.unregisterAllListeners(this);
    }

}