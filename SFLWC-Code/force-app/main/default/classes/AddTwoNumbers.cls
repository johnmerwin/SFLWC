public with sharing class AddTwoNumbers {
    // Learnong to pass parameters to an Apex method from LWC
    public AddTwoNumbers() {

    }

    @AuraEnabled
    public static Integer getSum(Integer firstNum, Integer secondNum) {
        return firstNum + secondNum;
    }
}