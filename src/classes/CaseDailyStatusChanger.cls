global class  CaseDailyStatusChanger Implements Database.Batchable <sObject>{
     public String QUERY ;
    
    public CaseDailyStatusChanger(){
        this.QUERY = 'SELECT Email_Send__c FROM Case';
    }
    
    global Database.queryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(QUERY);
    }

    global void execute(Database.BatchableContext bc, List<sObject> scope) {
        List<Case> listToUpdate = new List<Case>();
        for(sObject s : scope)
        {
            Case obj = (Case) s; 
            obj.Email_Send__c = false;
            listToUpdate.add(obj);
        }
        update listToUpdate; 
    }

	global void finish(Database.BatchableContext bc) {}
}