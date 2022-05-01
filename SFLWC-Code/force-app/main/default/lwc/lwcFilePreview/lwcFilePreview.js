import { LightningElement, wire, api } from 'lwc';
import getRelatedFilesByRecordId from '@salesforce/apex/LWCFilePreview.getRelatedFilesByRecordId';
import { NavigationMixin } from 'lightning/navigation';

export default class LwcFilePreview extends NavigationMixin(LightningElement) {
    @api recordId;
    fileIds;
    // Passing the record Id to the Apex method
    @wire(getRelatedFilesByRecordId, { recordId: '$recordId' })
    wiredResult({ data, error }) {
        if (data) {
            console.log(data);


            this.fileIds = Object.keys(data).map(item => ({
                "label": data[item], // File name
                "value": item,       // File Id   
                // Notice the back ticks in the url value below
                "url": `/sfc/servlet.shepherd/document/download/${item}`
            }));

            // To return an object literal expression requires parentheses ()
            // around the expression
            // params => ({foo: "a"}) // returns the object {foo: "a"} or this

            /*
                ({
                    "label": data[item],  
                    "value": item,          
                    "url": `/sfc/servlet.shepherd/document/download/${item}`
                })
            */





            console.log(this.fileIds);
        }
        if (error) {
            console.log(error);
        }
    }

    previewHandler(event) {
        //fileId = event.target.dataset.id;

        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview',
            },
            state: {
                selectedRecordId: this.fileIds
            }
        });
    }
}