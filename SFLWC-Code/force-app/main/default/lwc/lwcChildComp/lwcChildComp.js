import { LightningElement, api } from 'lwc';

export default class LwcChildComp extends LightningElement {
    @api message;
    @api className;

    get alertClassName() {
        return this.className ? 'alert ' + this.className : 'alert';
    }
}