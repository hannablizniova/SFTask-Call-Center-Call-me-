@isTest
public class TestCasesController {
    static testMethod void testListCasesForBoss(){
        List<Case> cases = new List<Case>();
        for(Integer i = 0; i < 200; i++){
            Case caseObj = new Case(Type = 'Feedback');
            cases.add(caseObj);
        }
        test.startTest();
		insert cases;
        test.stopTest();
        List<Case> resultList = CasesController.getListCasesForBoss();
        System.assertNotEquals(null, resultList);
    }
     static testMethod void testListCasesForCCManager(){
        Id managerRoleID = [SELECT UserRoleId from User where userrole.name like 'CC Manager%'].UserRoleId;
        Set<ID> allSubRoleIds = CasesController.getAllSubRoleIds(new Set<ID>{managerRoleID});
        List<Case> cases = [SELECT CaseNumber,Status,Owner.FirstName,
                                   Owner.LastName FROM Case 
                                   WHERE (Owner.Id IN : allSubRoleIds AND CreatedDate = LAST_N_DAYS:7)];
        System.assertNotEquals(null, cases);
     }
}