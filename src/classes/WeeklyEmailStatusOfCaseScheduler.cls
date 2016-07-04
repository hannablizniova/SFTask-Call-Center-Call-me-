global class WeeklyEmailStatusOfCaseScheduler implements Schedulable   {
public String schedule = '0 0 13 ? * 1?'; //Every Week at Midnight 

    global String scheduleMe() {
        WeeklyEmailStatusOfCaseScheduler SC = new WeeklyEmailStatusOfCaseScheduler (); 
        return System.schedule('Weekly Email Notification to Boss about all Cases', schedule , SC);
    }

    global void execute (SchedulableContext SC){
         CaseWeeklyStatusChanger schObj = new CaseWeeklyStatusChanger();
         database.executeBatch(schObj);
    }
}