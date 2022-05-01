import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/LWCContactController.getContacts';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

const columns = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Phone #', fieldName: 'Phone' }
]
export default class LwcRefreshContacts extends LightningElement {
    columns = columns;
    draftValues = [];
    @wire(getContactList)
    contact;

    handleSave(event) {
        console.log(event.detail.draftValues);

        const recordInputs = event.detail.draftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields }
        });
        console.log("recordInputs", recordInputs)

        const promises = recordInputs.map(recordInput => updateRecord(recordInput))
        Promise.all(promises).then(result => {
            this.showToastMsg('Success', 'Contacts updated');
            this.draftValues = [];
            return refreshApex(this.contact);
        }).catch(error => {
            this.showToastMsg('Error creating record', error.body.message, error);
        })
    }

    showToastMsg(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant || 'success'
            })
        )
    }
}