import { LightningElement, track } from 'lwc';

import createAccount from '@salesforce/apex/LWCCreateAnAccount.createAccount';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';
import ACCOUNT_TYPE from '@salesforce/schema/Account.Type';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class LwcCreateAccountApex extends LightningElement {
    @track accountId;

    @track accountRecord = {
        Name: ACCOUNT_NAME,
        Type: ACCOUNT_TYPE,
        Phone: ACCOUNT_PHONE
    }

    handleChange(event) {
        if (event.target.label == 'Name') {
            this.accountRecord.Name = event.target.value;
        }

        if (event.target.label == 'Type') {
            this.accountRecord.Type = event.target.value;
        }
        if (event.target.label == 'Phone') {
            this.accountRecord.Phone = event.target.value;
        }
    }

    saveAccount() {
        // createAccount is the Apex method we have imported at the top
        // acctRec is the name of parameter in the Apex method

        createAccount({
            acctRec: this.accountRecord
        })
            .then(result => {
                // Empty the rocord on success
                this.accountRecord = {};
                const toastEvent = new ShowToastEvent(
                    {
                        title: 'Create Account',
                        message: 'Account successfully created',
                        variant: 'success'
                    });
                this.dispatchEvent(toastEvent)
            })

            .catch(error => {
                const toastEvent = new ShowToastEvent(
                    {
                        title: 'Create Account',
                        message: 'Unable to create account',
                        variant: 'error'
                    });
                this.dispatchEvent(toastEvent)
            })
    }
}