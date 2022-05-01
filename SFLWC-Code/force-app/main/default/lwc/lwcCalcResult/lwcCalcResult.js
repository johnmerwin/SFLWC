import { LightningElement, api } from 'lwc';

export default class LwcCalcResult extends LightningElement {
    @api result;
    // This property will receive the data from the parent
    // The name of this property must be the same as declared
    // in the parent component. 
}