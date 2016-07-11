global class CaseEmailStatusScheduler implements Schedulable   {
public String schedule = '0 0 13 * * ?'; //Class runs everyday at 1 PM.

    global String scheduleMe() {
        CaseEmailStatusScheduler SC = new CaseEmailStatusScheduler (); 
        return System.schedule('Daily Email Notification to Owner about Case Status', schedule , SC);
    }

    global void execute (SchedulableContext SC){
         CaseEmailStatusChanger schObj = new  CaseEmailStatusChanger ();
         database.executeBatch(schObj);
    }
}