trigger CaseProductTrigger on Case_Product__c (after insert, after update, after delete ) {
    if(Trigger.isUpdate||Trigger.isInsert){
   	    CaseProductSumHelper.updateRelatedCaseProductSum(Trigger.NEW);
    }
    if(Trigger.isDelete){
        CaseProductSumHelper.updateRelatedCaseProductSum(Trigger.OLD);
    }
}