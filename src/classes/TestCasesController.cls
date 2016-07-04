@isTest
public class TestCasesController {
     public static final String CC_MANAGER = 'CC Manager%';
     public static final String CASE_TYPE = 'Feedback';
     static testMethod void testListCasesForBoss(){
        List<Case> cases = new List<Case>();
        for(Integer i = 0; i < 200; i++){
            Case caseObj = new Case(Type = CASE_TYPE);
            cases.add(caseObj);
        }
        test.startTest();
		insert cases;
        test.stopTest();
        List<Case> resultList = CasesController.getListCasesForBoss();
        System.assertNotEquals(null, resultList);
    }
   
    static testMethod void testAllSubRoleIds(){
       Id managerRoleID = [SELECT UserRoleId from User where userrole.name like :CC_MANAGER].UserRoleId;
       Set<ID> subRolesIds = CasesController.getAllSubRoleIds(new Set<ID>{managerRoleID});
       System.assertNotEquals(null, subRolesIds);
    }
      static testMethod void testListCasesForCCManager(){
        Id managerRoleID = [SELECT UserRoleId from User where userrole.name like :CC_MANAGER].UserRoleId;
        Set<ID> allSubRoleIds = CasesController.getAllSubRoleIds(new Set<ID>{managerRoleID});
        List<Case> cases = CasesController.getListCasesForCCManager();
        System.assertNotEquals(null, cases);
     }
}