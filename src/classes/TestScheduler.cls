@isTest
public class TestScheduler {   
    public static final String DAILY_FREQUENCY_CONST = '0 0 13 * * ?';
    public static final String WEEKLY_FREQUENCY_CONST = '0 0 13 ? * 1?';
    public static final String TEST_STR = 'TEST'; 
    
    static testMethod void  testDailyScheduleMe() {
         List<Case> listToUpdate = new List<Case>();
         Test.StartTest();
         List<Case> cases = [SELECT Email_Send__c FROM Case];
         for(Case caseObj : cases){
             caseObj.Email_Send_Weekly__c = false;
             listToUpdate.add(caseObj);
         }
         update listToUpdate;
         DailyEmailStatusOfCaseScheduler.scheduleMe();
         DailyEmailStatusOfCaseScheduler sh = new DailyEmailStatusOfCaseScheduler();
         System.schedule(TEST_STR, DAILY_FREQUENCY_CONST, sh);
         Test.stopTest();         
     }
    
    static testMethod void  testWeeklyScheduleMe() {
         List<Case> listToUpdate = new List<Case>();
         Test.StartTest();
         List<Case> cases = [SELECT Email_Send__c FROM Case];
         for(Case caseObj : cases){
             caseObj.Email_Send_Weekly__c = false;
             listToUpdate.add(caseObj);
         }
         update listToUpdate;
         WeeklyEmailStatusOfCaseScheduler.scheduleMe();
         WeeklyEmailStatusOfCaseScheduler sh = new WeeklyEmailStatusOfCaseScheduler();
         System.schedule(TEST_STR, WEEKLY_FREQUENCY_CONST, sh);
         Test.stopTest();         
     }
}