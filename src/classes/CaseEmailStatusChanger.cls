global class  CaseEmailStatusChanger Implements Database.Batchable <sObject>{

global Database.queryLocator start(Database.BatchableContext bc) {
    String SOQL = 'SELECT Email_Send__c FROM Case';
    return Database.getQueryLocator(SOQL);
}

global void execute(Database.BatchableContext bc, List<sObject> scope) {
    list<Case> listToUpdate = new list<Case>();
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