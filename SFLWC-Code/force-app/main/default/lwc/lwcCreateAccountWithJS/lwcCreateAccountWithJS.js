import { LightningElement } from 'lwc';

// Since we are going to create an Account object we need to
// import the Account object and the fields we will be using.
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

// To create a record we need to import the following
import { createRecord } from 'lightning/uiRecordApi';

// This is for the toast message
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

// This is for navigating to the newly created record
import { NavigationMixin } from 'lightning/navigation';

export default class LwcCreateAccountWithJS extends NavigationMixin(LightningElement) {
    name = '';
    phone = '';
    handleChange(event) {
        if (event.target.label === "Name") {
            this.name = event.target.value;
        }
        if (event.target.label === "Phone") {
            this.phone = event.target.value;
        }

    }

    createAccount() {
        // Prepare the fields for saving the data
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.name;
        fields[PHONE_FIELD.fieldApiName] = this.phone;

        const accountInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields }
        createRecord(accountInput)
            .then(account => {
                this.accountId = account.Id;

                this.dispatchEvent(
                    new ShowToastEvent(
                        {
                            title: 'Create Account',
                            message: 'Account successfully created',
                            variant: 'success'
                        })
                );
                // Navigate to the record we just created
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: account.id,
                        objectApiName: 'Account',
                        actionName: 'view'
                    },
                });
            }) // then
            .catch(error => {
                const toastEvent = new ShowToastEvent(
                    {
                        title: 'Create Account',
                        message: 'Account could not be created!',
                        variant: 'error'
                    });
                this.dispatchEvent(toastEvent);
            })

    }
}