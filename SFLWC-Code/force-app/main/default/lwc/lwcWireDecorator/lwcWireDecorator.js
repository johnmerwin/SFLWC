import { LightningElement, track, wire } from 'lwc';
// Import the getAccounts() method we created in Apex
// in the LWCAccountController class

import getAccounts from '@salesforce/apex/LWCAccountController.getAccounts';

export default class LwcWireDecorator extends LightningElement {
    @track data;

    // A promise is returned in the accountRecords() function
    // with error and data properties. getAccounts is the alias
    // we have declared at the top.
    @wire(getAccounts) accountRecords({ error, data }) {
        if (data) {
            this.data = data;
        } else if (error) {
            this.data = undefined;
        }
    }
}