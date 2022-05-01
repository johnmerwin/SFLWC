import { LightningElement } from 'lwc';

export default class LwcParentArrayComp extends LightningElement {
    employeeDetails = [
        {
            id: "1",
            firstName: "Tom",
            lastName: "Cruise"
        },
        {
            id: "2",
            firstName: "Maria",
            lastName: "Sharapova"
        },
        {
            id: "3",
            firstName: "James",
            lastName: "Bond"
        }
    ]
}