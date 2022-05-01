import { LightningElement, api, wire } from 'lwc';
import getOppsWithAccountId from '@salesforce/apex/LWCOppController.getOppsWithAccountId';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Close Date', fieldName: 'CLoseDate' },
    { label: 'Stage', fieldName: 'StageName' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
];
export default class LwcOppsList extends LightningElement {
    columns = columns;
    @api acctId;
    @api acctName;

    // Pass the account Id as a parameter to the Apex method
    // and let it return the list of contacts to the getContacts
    // property. acctId is the name of the parameter in the Apex
    // method we have imported above. '$acctId' is the value of the
    // Account Id we have selected by clicking on the hyperlink in 
    // the Accounts list.

    @wire(getOppsWithAccountId, { acctId: '$acctId' }) getOpps;
}