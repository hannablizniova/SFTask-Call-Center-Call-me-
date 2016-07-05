@IsTest public with sharing class CaseProductSumHelperTest {
    
    private static final Decimal PRICE = 100;
   
    @testSetup
    static void setup(){
    	RecordType caseRecordType = [SELECT Id FROM RecordType WHERE Name = 'Product Inquiry' LIMIT 1];
    	
    	Case testCase = new Case(RecordTypeId= caseRecordType.Id, Status = 'New', Origin = 'Phone', Subject = 'testCase');
    	insert testCase;
    	
    	Product2 testProductOne = new Product2(Name = 'TestProductOne', price__c = PRICE);
    	insert testProductOne;
    	
    	Product2 TestProductTwo = new Product2(Name = 'TestProductTwo', price__c = (PRICE+PRICE));
    	insert testProductTwo;
    	
    	
    }
    
    @IsTest
    static void updateProductSumIncrease(){
        Case testCase = [SELECT Id FROM Case WHERE Subject = 'testCase'];
        Id testCaseId = testCase.Id;
		Product2 testProductOne = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductOne'];
        Product2 testProductTwo = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductTwo'];

		Case_Product__c CaseProductOne = new Case_product__c(Case__c = testCase.Id, Product__c = testProductOne.Id);
    	Case_Product__c CaseProductTwo = new Case_product__c(Case__c = testCase.Id, Product__c = testProductTwo.Id);
        List<Case_Product__c> caseProducts = new List<Case_product__c>();
    	caseProducts.add(CaseProductOne);
    	caseProducts.add(CaseProductTwo);
        
        Test.startTest();
    	insert caseProducts;
        Test.stopTest();
        
        Case resultCase = [SELECT Id, Product_Sum__c FROM Case  WHERE Id = :testCaseId];
    	System.assertEquals(resultCase.Product_Sum__c, testProductOne.Price__c + testProductTwo.Price__c);
		    	
    }
    
    @IsTest
    static void updateProductSumDecreaseToZero(){
         Case testCase = [SELECT Id FROM Case WHERE Subject = 'testCase'];
        Id testCaseId = testCase.Id;
		Product2 testProductOne = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductOne'];
        Product2 testProductTwo = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductTwo'];

		Case_Product__c CaseProductOne = new Case_product__c(Case__c = testCase.Id, Product__c = testProductOne.Id);
    	Case_Product__c CaseProductTwo = new Case_product__c(Case__c = testCase.Id, Product__c = testProductTwo.Id);
        List<Case_Product__c> caseProducts = new List<Case_product__c>();
    	caseProducts.add(CaseProductOne);
    	caseProducts.add(CaseProductTwo);
        insert caseProducts;
        
        Test.startTest();
    	delete caseProducts;
        Test.stopTest();
        
        Case resultCase = [SELECT Id, Product_Sum__c FROM Case  WHERE Id = :testCaseId];
    	System.assertEquals(resultCase.Product_Sum__c, 0);
	}
    
    @IsTest
    static void updateProductSumDecreasePartial(){
         Case testCase = [SELECT Id FROM Case WHERE Subject = 'testCase'];
        Id testCaseId = testCase.Id;
		Product2 testProductOne = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductOne'];
        Product2 testProductTwo = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductTwo'];

		Case_Product__c CaseProductOne = new Case_product__c(Case__c = testCase.Id, Product__c = testProductOne.Id);
    	Case_Product__c CaseProductTwo = new Case_product__c(Case__c = testCase.Id, Product__c = testProductTwo.Id);
        List<Case_Product__c> caseProducts = new List<Case_product__c>();
    	caseProducts.add(CaseProductOne);
    	caseProducts.add(CaseProductTwo);
        insert caseProducts;
        
        Test.startTest();
    	delete CaseProductOne;
        Test.stopTest();
        
        Case resultCase = [SELECT Id, Product_Sum__c FROM Case  WHERE Id = :testCaseId];
    	System.assertEquals(resultCase.Product_Sum__c, testProductTwo.Price__c);
	}
    
    @IsTest
    static void updateProductSumByChangeInProduct(){
         Case testCase = [SELECT Id FROM Case WHERE Subject = 'testCase'];
        Id testCaseId = testCase.Id;
		Product2 testProductOne = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductOne'];
        Product2 testProductTwo = [SELECT Id, Price__c FROM Product2 WHERE Name = 'TestProductTwo'];

		Case_Product__c CaseProductOne = new Case_product__c(Case__c = testCase.Id, Product__c = testProductOne.Id);
    	Case_Product__c CaseProductTwo = new Case_product__c(Case__c = testCase.Id, Product__c = testProductTwo.Id);
        List<Case_Product__c> caseProducts = new List<Case_product__c>();
    	caseProducts.add(CaseProductOne);
    	caseProducts.add(CaseProductTwo);
        insert caseProducts;
        
        Test.startTest();
        testProductOne.Price__c = testProductOne.Price__c+PRICE;
    	update testProductOne;
        Test.stopTest();
        
        Case resultCase = [SELECT Id, Product_Sum__c FROM Case  WHERE Id = :testCaseId];
    	System.assertEquals(resultCase.Product_Sum__c, testProductOne.Price__c+testProductTwo.Price__c);
    }
}