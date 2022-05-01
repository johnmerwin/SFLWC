import { LightningElement, track, wire } from 'lwc';

// Import the getAccounts() method we created in Apex
// in the LWCAccountController class

import getAccounts from '@salesforce/apex/LWCAccountController.getAccounts';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Industry', fieldName: 'Industry' },
    { label: 'Rating', fieldName: 'Rating' },
];

export default class LwcWireDecorator extends LightningElement {
    columns = columns;
    @track data;

    // A promise is returned in the accountRecords() function
    // with error and data properties
    @wire(getAccounts) accountRecords({ error, data }) {
        if (data) {
            this.data = data;
        } else if (error) {
            this.data = undefined;
        }
    }
}