import { LightningElement, wire, api } from 'lwc';
import getContactsWithAccountId from '@salesforce/apex/LWCContactController.getContactsWithAccountId';

const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Phone', fieldName: 'Phone' },
];

export default class LwcContactList extends LightningElement {
    data;
    error;
    columns = columns;
    @api acctId;
    @api acctName;

    // Pass the account Id as a parameter to the Apex method
    // and let it return the list of contacts to the getContacts
    // property. acctId is the name of the parameter in the Apex
    // method we have imported above. '$acctId' is the value of the
    // Account Id we have selected by clicking on the hyperlink in 
    // the Accounts list.

    @wire(getContactsWithAccountId, { acctId: '$acctId' }) getContacts;



}