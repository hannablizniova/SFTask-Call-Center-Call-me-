@isTest
public class TestScheduler {   
    public static final String FREQUENCY_CONST = '0 0 23 * * ?';
    static testMethod void  testCaseEmailStatusScheduler() {
        Test.StartTest();
        DailyEmailStatusOfCaseScheduler scheduler = new DailyEmailStatusOfCaseScheduler();      
        String frequency = FREQUENCY_CONST;
        system.schedule('Test check', frequency, scheduler);
        Test.stopTest();
    }
    static testMethod void  testCaseWeeklyStatusScheduler() {
        Test.StartTest();
        WeeklyEmailStatusOfCaseScheduler scheduler = new WeeklyEmailStatusOfCaseScheduler();      
        String frequency = FREQUENCY_CONST;
        system.schedule('Test check', frequency, scheduler);
        Test.stopTest();
    }
}