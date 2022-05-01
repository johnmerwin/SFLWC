import { LightningElement, api } from 'lwc';

export default class LwcModalChild extends LightningElement {
    @api headerText;
    @api bodyText;

    closeHandler() {
        // We will be dispatching this event to the parent component
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }
}