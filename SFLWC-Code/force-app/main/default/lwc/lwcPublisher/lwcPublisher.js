import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import pubsub from 'c/lwcPubSubRecipe';
//import { fireEvent } from '../lwcPubSubRecipe/lwcPubSubRecipe';

export default class LwcPublisher extends LightningElement {
    @wire(CurrentPageReference) curPageRef;
    publishMessage(event) {
        pubsub.fireEvent(this.curPageRef, 'messagesend', 'Message From Publisher');
    }

}