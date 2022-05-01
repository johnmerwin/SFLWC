import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/LWCAccountController.getAccounts';

export default class LwcAccountsList extends LightningElement {
    @wire(getAccounts) accounts
    // List of accounts will be returned in the accounts property above

    accountIdFromParent;
    accountName;

    handleClick(event) {
        event.preventDefault();
        this.accountIdFromParent = event.target.dataset.accountid;
        this.accountName = event.target.dataset.name;
        console.log('Account Name: ' + this.accountName)
    }
}