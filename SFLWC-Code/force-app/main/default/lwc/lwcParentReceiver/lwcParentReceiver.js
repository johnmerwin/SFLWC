import { LightningElement } from 'lwc';

export default class LwcParentReceiver extends LightningElement {
    msgFromChild;
    showMessageFromChild(event) {
        this.msgFromChild = event.detail;
    }
}