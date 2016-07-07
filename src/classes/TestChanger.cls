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
        CaseDailyStatusChanger changer = new CaseDailyStatusChanger();
        queryLocator = changer.start(batchContext);
        changer.execute(batchContext, caseListToUpdate);
        List<Case> listCase = [SELECT Email_Send__c FROM Case];
        for(Case caseObj : listCase){
            System.assertEquals(FALSE, caseObj.Email_Send__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();       
    }
    
    static testMethod void testBigListCaseEmailStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> caseListToUpdate = new List<Case>();
         for(integer i = 0; i < 1 ; i++){
             Case caseTestObj = new Case(Email_Send__c = TRUE);
             caseListToUpdate.add(caseTestObj);
         }
        insert caseListToUpdate;
        CaseDailyStatusChanger changer = new CaseDailyStatusChanger();
        queryLocator = changer.start(batchContext);
        changer.execute(batchContext, caseListToUpdate);
        List<Case> listCase = [SELECT Email_Send__c FROM Case];
        for(Case caseObj : listCase){
            System.assertEquals(FALSE, caseObj.Email_Send__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();       
    }
      
    static testMethod void testNullCaseEmailStatusChanger() {
        try{
            Test.startTest();
            Database.QueryLocator queryLocator;
            Database.BatchableContext batchContext;
            List<Case> caseListToUpdate = null;
            insert caseListToUpdate;
            CaseDailyStatusChanger changer = new CaseDailyStatusChanger();
            queryLocator = changer.start(batchContext);
            changer.execute(batchContext, caseListToUpdate);
            List<Case> listCase = [SELECT Email_Send__c FROM Case];
            for(Case caseObj : listCase){
                System.assertEquals(FALSE, caseObj.Email_Send__c);
            }
            changer.finish(batchContext);  
        }catch(NullPointerException e){
            System.assert(e.getMessage().contains('Attempt to de-reference a null object'),
            e.getMessage());
        } finally{
            Test.stopTest();                
        }         
    }
    
    static testMethod void testEmptyListCaseEmailStatusChanger() {
            Test.startTest();
            Database.QueryLocator queryLocator;
            Database.BatchableContext batchContext;
            List<Case> caseListToUpdate = new List<Case>();
            insert caseListToUpdate;
            CaseDailyStatusChanger changer = new CaseDailyStatusChanger();
            queryLocator = changer.start(batchContext);
            changer.execute(batchContext, caseListToUpdate);
            List<Case> listCase = [SELECT Email_Send__c FROM Case];
             if(!listCase.isEmpty()){
                 for(Case caseObj : listCase){
                    System.assertEquals(FALSE, caseObj.Email_Send__c);
                }
             }
             else{
                 System.debug('listCase is empty');
             }            
            changer.finish(batchContext);  
            Test.stopTest();            
    }
    
    static testMethod void testCaseWeeklyStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> caseListToUpdate = new List<Case>();
         for(integer i = 0; i < 5 ; i++){
             Case caseTestObj = new Case(Email_Send_Weekly__c = TRUE);
             caseListToUpdate.add(caseTestObj);
         }
        insert caseListToUpdate;
        CaseWeeklyStatusChanger changer = new CaseWeeklyStatusChanger();
        queryLocator = changer.start(batchContext);
        changer.execute(batchContext, caseListToUpdate);
        List<Case> listCase = [SELECT Email_Send_Weekly__c FROM Case];
        for(Case caseObj : listCase){
            System.assertEquals(FALSE, caseObj.Email_Send_Weekly__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();        
    }
    
    static testMethod void testBigListCaseWeeklyStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> caseListToUpdate = new List<Case>();
         for(integer i = 0; i < 100 ; i++){
             Case caseTestObj = new Case(Email_Send_Weekly__c = TRUE);
             caseListToUpdate.add(caseTestObj);
         }
        insert caseListToUpdate;
        CaseWeeklyStatusChanger changer = new CaseWeeklyStatusChanger();
        queryLocator = changer.start(batchContext);
        changer.execute(batchContext, caseListToUpdate);
        List<Case> listCase = [SELECT Email_Send_Weekly__c FROM Case];
        for(Case caseObj : listCase){
            System.assertEquals(FALSE, caseObj.Email_Send_Weekly__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();        
    }
    
    static testMethod void testNullCaseWeeklyStatusChanger() {
        try{
            Test.startTest();
            Database.QueryLocator queryLocator;
            Database.BatchableContext batchContext;
            List<Case> caseListToUpdate = null;
            insert caseListToUpdate;
            CaseWeeklyStatusChanger changer = new CaseWeeklyStatusChanger();
            queryLocator = changer.start(batchContext);
            changer.execute(batchContext, caseListToUpdate);
            List<Case> listCase = [SELECT Email_Send_Weekly__c FROM Case];
            for(Case caseObj : listCase){
                System.assertEquals(FALSE, caseObj.Email_Send_Weekly__c);
            }
            changer.finish(batchContext);   
        }catch(NullPointerException e){
            System.assert(e.getMessage().contains('Attempt to de-reference a null object'),
            e.getMessage());
        } finally{
            Test.stopTest();                
        }         
    }
    
    static testMethod void testEmptyListCaseWeeklyStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> caseListToUpdate = new List<Case>();
        insert caseListToUpdate;
        CaseWeeklyStatusChanger changer = new CaseWeeklyStatusChanger();
        queryLocator = changer.start(batchContext);
        changer.execute(batchContext, caseListToUpdate);
        List<Case> listCase = [SELECT Email_Send_Weekly__c FROM Case];
        if(!listCase.isEmpty()){
             for(Case caseObj : listCase){
                System.assertEquals(FALSE, caseObj.Email_Send_Weekly__c);
             }
         }
         else{
               System.debug('listCase is empty');
         }            
        changer.finish(batchContext);  
        Test.stopTest();        
    }        
}