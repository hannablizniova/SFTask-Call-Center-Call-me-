global class WeeklyEmailStatusOfCaseScheduler implements Schedulable   {
	public static final String SCHEDULE = '0 0 13 ? * 1?'; //Every Week at Midnight 
	public static final String JOB_MESSAGE = 'Weekly Email Notification to Boss about all Cases';
    
    global static String scheduleMe() {
        WeeklyEmailStatusOfCaseScheduler SC = new WeeklyEmailStatusOfCaseScheduler (); 
        return System.schedule(JOB_MESSAGE, SCHEDULE , SC);
    }

    global void execute (SchedulableContext SC){
         CaseWeeklyStatusChanger schObj = new CaseWeeklyStatusChanger();
         database.executeBatch(schObj);
    }
}