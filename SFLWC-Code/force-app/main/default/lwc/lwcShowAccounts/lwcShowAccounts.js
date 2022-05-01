import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/LWCAccountController.getAccounts';

export default class LwcShowAccounts extends LightningElement {
    @wire(getAccounts) accounts;
    accountIdFromParent;
    accountName;

    handleClick(event) {
        event.preventDefault();
        this.accountIdFromParent = event.target.dataset.accountid;
        this.accountName = "Opportunities For " + event.target.dataset.name;
    }
}