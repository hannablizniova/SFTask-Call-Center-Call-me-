@isTest
public class TestScheduler {   
    public static final String DAILY_FREQUENCY_CONST = '0 0 13 * * ?';
    public static final String WEEKLY_FREQUENCY_CONST = '0 0 13 ? * 1?';
    public static final String DUMMY_FREQUENCY_CONST = '4D_111 22 1?';
    public static final String TEST_STR = 'TEST'; 
    
    static testMethod void  testDailyScheduleMe() {
         Test.StartTest();
         DailyEmailStatusOfCaseScheduler.scheduleMe();
         DailyEmailStatusOfCaseScheduler sh = new DailyEmailStatusOfCaseScheduler();
         System.schedule(TEST_STR, DAILY_FREQUENCY_CONST, sh);
         Test.stopTest();         
     }
    
    static testMethod void  testNullDailyScheduleMe() {
        try{
            Test.StartTest();
            DailyEmailStatusOfCaseScheduler.scheduleMe();
            DailyEmailStatusOfCaseScheduler sh = new DailyEmailStatusOfCaseScheduler();
            System.schedule(TEST_STR, null, sh);
        }catch(StringException e){
            System.assert(e.getMessage().contains('cron expression cannot be \'null\''),
         e.getMessage());
        } finally{
            Test.stopTest();                
        }            
     }
    
    static testMethod void  testDummyFrequencyDailyScheduleMe() {
        try{
            Test.StartTest();
            DailyEmailStatusOfCaseScheduler.scheduleMe();
            DailyEmailStatusOfCaseScheduler sh = new DailyEmailStatusOfCaseScheduler();
            System.schedule(TEST_STR, DUMMY_FREQUENCY_CONST, sh);
        }catch(StringException e){
            System.assert(e.getMessage().contains('Unexpected end of expression.'),
         e.getMessage());
        } finally{
            Test.stopTest();                
        }     
     }
    
    static testMethod void testWeeklyScheduleMe() {
         Test.StartTest();
         WeeklyEmailStatusOfCaseScheduler.scheduleMe();
         WeeklyEmailStatusOfCaseScheduler sh = new WeeklyEmailStatusOfCaseScheduler();
         System.schedule(TEST_STR, WEEKLY_FREQUENCY_CONST, sh);
         Test.stopTest();         
     }
    
    static testMethod void testNullWeeklyScheduleMe() {
        try{
             Test.StartTest();
             WeeklyEmailStatusOfCaseScheduler.scheduleMe();
             WeeklyEmailStatusOfCaseScheduler sh = new WeeklyEmailStatusOfCaseScheduler();
             System.schedule(TEST_STR, null, sh);
          }catch(StringException e){
            System.assert(e.getMessage().contains('cron expression cannot be \'null\''),
            e.getMessage());
        } finally{
            Test.stopTest();                
        }           
     }
    
    static testMethod void testDummyFrequencyWeeklyScheduleMe() {
        try{
             Test.StartTest();
             WeeklyEmailStatusOfCaseScheduler.scheduleMe();
             WeeklyEmailStatusOfCaseScheduler sh = new WeeklyEmailStatusOfCaseScheduler();
             System.schedule(TEST_STR, DUMMY_FREQUENCY_CONST, sh);
          }catch(StringException e){
            System.assert(e.getMessage().contains('Unexpected end of expression.'),
            e.getMessage());
        } finally{
            Test.stopTest();                
        }             
     }
}