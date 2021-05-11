global class DailyEmailStatusOfCaseScheduler implements Schedulable   {
    public static String SCHEDULE = '0 0 13 * * ?'; //Class runs everyday at 1 PM.
    public static String JOB_MESSAGE = 'Daily Email Notification to Owner about Case Status';
    
    global static String scheduleMe() {
        DailyEmailStatusOfCaseScheduler SC = new DailyEmailStatusOfCaseScheduler(); 
        return System.schedule(JOB_MESSAGE, SCHEDULE , SC);
    }

    global static void execute (SchedulableContext SC){
         CaseDailyStatusChanger schObj = new CaseDailyStatusChanger();
         database.executeBatch(schObj);
    }
}