import { LightningElement } from 'lwc';

export default class LwcChildSender extends LightningElement {

    sendMessageToParent() {
        const custEvent = new CustomEvent('childmessage', { detail: 'Message From Child' });
        this.dispatchEvent(custEvent);
    }
}