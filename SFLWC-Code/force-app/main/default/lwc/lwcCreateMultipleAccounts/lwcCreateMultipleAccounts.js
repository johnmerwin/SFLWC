import { LightningElement, track } from 'lwc';
import createMutipleAccounts from '@salesforce/apex/LWCCreateAnAccount.createMutipleAccounts';

import { ShowToastEvent } from 'lightning/platformShowToastEvent'

export default class LwcCreateMultipleAccounts extends LightningElement {
    @track keyIndex = 0;
    @track acctRecsList = [
        {
            Name: '',
            Industry: '',
            Type: ''
        }
    ];

    addRow() {
        // Create an empty row when we click on the Add Row button
        this.keyIndex + 1;
        this.acctRecsList.push({
            Name: '',
            Industry: '',
            Type: ''
        })
    }

    removeRow(event) {

        console.log('Access key2:' + event.target.accessKey);
        console.log(event.target.id.split('-')[0]);

        // Identify the row that needs to be deleted using the
        // event.target.accessKey property

        if (this.acctRecsList.length >= 1) {
            this.acctRecsList.splice(event.target.accessKey, 1);
            this.keyIndex - 1;
        }
    }

    saveMultipleAccounts() {
        //console.log("Account List: "+ JSON.stringify(this.acctRecsList));

        // Call the Apex method imported above 
        createMutipleAccounts({ lstAccts: this.acctRecsList })
            .then(result => {
                this.message = result;
                this.error = undefined;

                this.acctRecsList.forEach(function (item) {
                    item.Name = '';
                    item.Industry = '';
                    item.Phone = '';
                });

                //this.accountRecList = [];
                if (this.message !== undefined) {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Accounts Created!',
                            variant: 'success',
                        }),
                    );
                }

                console.log(JSON.stringify(result));
                console.log("result", this.message);
            })
            .catch(error => {
                this.message = undefined;
                this.error = error;

                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating records',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
                console.log("Error: ", JSON.stringify(this.error));
            });
    }

    changeHandler(event) {

        console.log('Access Key: ' + event.target.accessKey);
        console.log('Id: ' + event.target.id);
        console.log('Value: ' + event.target.value);

        // Read the values for each row whnever there is a change
        // and store  them in accRecsList array.

        if (event.target.name === 'accName')
            this.acctRecsList[event.target.accessKey].Name = event.target.value;
        else if (event.target.name === 'accIndustry') {
            this.acctRecsList[event.target.accessKey].Industry = event.target.value;
        }
        else if (event.target.name === 'accPhone') {
            this.acctRecsList[event.target.accessKey].Phone = event.target.value;
        }
    }


}