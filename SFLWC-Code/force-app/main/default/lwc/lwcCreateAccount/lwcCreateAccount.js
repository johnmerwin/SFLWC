import { LightningElement, api } from 'lwc';

// Import the required fields from the Account object
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Type from '@salesforce/schema/Account.Type';
import Account_Industry from '@salesforce/schema/Account.Industry';

// Import the ShowToastEvent to show a taost message
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

// Impot Navigation module to navigate to the record we just created
import { NavigationMixin } from 'lightning/navigation';

export default class LwcCreateAccount extends NavigationMixin(LightningElement) {
    objectApiName = 'Account';
    fieldList = [Account_Name, Account_Type, Account_Industry];

    handleAccountCreation(event) {
        const toastEvent = new ShowToastEvent({
            title: 'Account Create',
            message: 'Record Id: ' + event.detail.id,
            variant: 'success'
        });
        this.dispatchEvent(toastEvent);

        // Navigate to the Account record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                objectApiName: 'Account',
                recordId: event.detail.id,
                actionName: 'view',
            },
        });
    }
}