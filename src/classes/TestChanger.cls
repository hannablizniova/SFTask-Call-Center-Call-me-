@isTest
public class TestChanger {
 static testMethod void testCaseEmailStatusChanger() {
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
    }
    static testMethod void testCaseWeeklyStatusChanger() {
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
    }
}