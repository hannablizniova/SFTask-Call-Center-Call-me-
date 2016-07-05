@isTest
public class TestChanger {
    
 static testMethod void testCaseEmailStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> caseListToUpdate = new List<Case>();
         for(integer i = 0; i < 5 ; i++){
             Case caseTestObj = new Case(Email_Send__c = TRUE);
             caseListToUpdate.add(caseTestObj);
         }
        insert caseListToUpdate;
        CaseEmailStatusChanger changer = new CaseEmailStatusChanger();
        queryLocator = changer.start(batchContext);
        changer.execute(batchContext, caseListToUpdate);
        List<Case> listCase = [SELECT Email_Send__c FROM Case WHERE Email_Send__c =:true];
        for(Case caseObj : listCase){
            System.assert(FALSE, caseObj.Email_Send__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();     
    }
    
    static testMethod void testCaseWeeklyStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> caseListToUpdate = new List<Case>();
         for(integer i = 0; i < 5 ; i++){
             Case caseTestObj = new Case(Email_Send__c = TRUE);
             caseListToUpdate.add(caseTestObj);
         }
        insert caseListToUpdate;
        CaseWeeklyStatusChanger changer = new CaseWeeklyStatusChanger();
        queryLocator = changer.start(batchContext);
        changer.execute(batchContext, caseListToUpdate);
        List<Case> listCase = [SELECT Email_Send__c FROM Case WHERE Email_Send__c =:true];
        for(Case caseObj : listCase){
            System.assert(FALSE, caseObj.Email_Send__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();        
    }
        
}