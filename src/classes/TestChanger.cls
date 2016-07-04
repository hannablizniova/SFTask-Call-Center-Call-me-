@isTest
public class TestChanger {
    
 static testMethod void testCaseEmailStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> casesList = new List<Case>();
        CaseEmailStatusChanger changer = new CaseEmailStatusChanger();
        queryLocator = changer.start(batchContext);
        
        Database.QueryLocatorIterator queryIterator =  queryLocator.iterator();
        while (queryIterator.hasNext())
        {
            Case caseObj = (Case)queryIterator.next(); 
            casesList.add(caseObj);
        }        
        
        changer.execute(batchContext, casesList);
     
        for(Case caseObj : casesList){
            System.assert(FALSE, caseObj.Email_Send__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();     
    }
    
    static testMethod void testCaseWeeklyStatusChanger() {
        Test.startTest();
        Database.QueryLocator queryLocator;
        Database.BatchableContext batchContext;
        List<Case> casesList = new List<Case>();
        CaseWeeklyStatusChanger changer = new CaseWeeklyStatusChanger();
        queryLocator = changer.start(batchContext);
        
        Database.QueryLocatorIterator queryIterator =  queryLocator.iterator();
        while (queryIterator.hasNext())
        {
            Case caseObj = (Case)queryIterator.next(); 
            casesList.add(caseObj);
        }        
        
        changer.execute(batchContext, casesList);
        for(Case caseObj : casesList){
            System.assert(FALSE, caseObj.Email_Send_Weekly__c);
        }
        changer.finish(batchContext);   
        Test.StopTest();     
    }
        
}