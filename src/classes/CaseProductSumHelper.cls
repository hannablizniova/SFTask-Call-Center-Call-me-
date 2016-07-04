public class CaseProductSumHelper {

    public static void updateRelatedCaseProductSum(List<Case_Product__c> caseProductChanges){
        Set<Id> relatedCaseIds = new Set<Id>();
        for(Case_Product__c caseProduct: caseProductChanges){
            relatedCaseIds.add(caseProduct.Case__c);
        }
        
        List<AggregateResult> updatedSums = [SELECT Case__c, SUM(Product__r.Price__c) productSum 
                                             FROM Case_Product__c 
                                             WHERE Case__c IN:relatedCaseIds 
                                             GROUP BY Case__c];
     	   
        Map<Id, Case> casesForUpdate = new Map<Id, Case>();
        
        //Set Product Sum for those cases that has records in junction table
        for(AggregateResult aggregateResultRow: updatedSums){
            Id caseId = (Id) aggregateResultRow.get('Case__c');
            Decimal productSum = (Decimal) aggregateResultRow.get('productSum');
            casesForUpdate.put(caseId, new Case(Id = caseId, Product_Sum__c = productSum));
        }
        
        //Set zero Product Sum for cases, which have no records in junction table
        for(Id caseId : relatedCaseIds){
            if(!casesForUpdate.containskey(caseId)){
                casesForUpdate.put(caseId, new Case(Id = caseId, Product_Sum__c = 0));
            }
        }
        
        update casesForUpdate.values();
    }
    
        public static void updateRelatedCaseProductSum(List<Product2> productChanges){
        Set<Id> relatedProductIds = new Set<Id>();
        for(Product2 currentProduct: productChanges){
            relatedProductIds.add(currentProduct.Id);
        }
        
        updateRelatedCaseProductSum([SELECT Id, Case__c, Product__c
                                     FROM Case_Product__c
                                     WHERE Product__c IN: relatedProductIds]);
    }
}