trigger ProductTrigger on Product2 (after update) {
	if(Trigger.isUpdate){
   	    CaseProductSumHelper.updateRelatedCaseProductSum(Trigger.NEW);
    }
}