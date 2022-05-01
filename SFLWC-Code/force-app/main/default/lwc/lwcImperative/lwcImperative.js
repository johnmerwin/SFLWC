import { LightningElement, track } from 'lwc';
// Import the getAccounts() method we created in Apex
// in the LWCAccountController class

import getAccountsImperative from '@salesforce/apex/LWCAccountController.getAccountsImperative';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Industry', fieldName: 'Industry' },
    { label: 'Rating', fieldName: 'Rating' },
];
export default class LwcImperative extends LightningElement {
    @track lstAccts
    @track error
    columns = columns

    connectedCallback() {
        // connectedCallback() is the LWC equivalent of "init" in Aura
        getAccountsImperative()
            .then(result => {
                this.lstAccts = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.lstAccts = undefined;
            });
    }
}