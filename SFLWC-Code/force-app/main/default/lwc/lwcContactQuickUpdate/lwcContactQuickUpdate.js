import { LightningElement, api } from 'lwc';

//Import fields from Contact Object
import Contact_Phone from '@salesforce/schema/Contact.Phone';
import Contact_Email from '@salesforce/schema/Contact.Email';
import Contact_LastName from '@salesforce/schema/Contact.LastName';

// Import the ShowToastEvent to show a toast message
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class LwcContactQuickUpdate extends LightningElement {
    // Since are going to use the two variables to edit a Contact record
    // we need to declare them with an @api decorator.
    @api recordId;
    @api objectApiName = 'Contact';
    fieldList = [Contact_Phone, Contact_Email, Contact_LastName];

    handleContactUpdate(event) {
        const toastEvent = new ShowToastEvent({
            title: 'Contact Update',
            message: 'Record is successfully updated ==> ' + event.detail.fields.LastName.value,
            variant: 'success'
        });
        this.dispatchEvent(toastEvent);

    }
}