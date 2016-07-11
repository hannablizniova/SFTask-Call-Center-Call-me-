@isTest
public class TestCasesController {
     public static final String CC_MANAGER = 'CC Manager';
     public static final String STANDART_USER = 'Standard User';
     public static final String CASE_TYPE = 'Feedback';
     public static final String LAST_NAME = 'LIVESTON';
     public static final String FIRST_NAME = 'JASON1000';
     public static final String ALIAS = 'jliv1';
     public static final String EMAIL = 'jason1000.liveston@asdf.com';
     public static final String USERNAME = 'jason1000.liveston@asdf.com';
     public static final String TIME_ZONE_SID_KEY = 'GMT';
     public static final String LANGUAGE_LOCALE_KEY = 'en_US';
     public static final String EMAIL_ENCODING_KEY = 'UTF-8';
     public static final String LOCALE_SID_KEY = 'en_US';

   
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
       test.startTest();
       User manager = createCCManager();
       Id managerRoleID = [select userroleid from user where id=: manager.id].UserRoleId;
       Set<ID> subRolesIds = CasesController.getAllSubRoleIds(new Set<ID>{managerRoleID});
       System.assertNotEquals(null, subRolesIds);
       test.stopTest();
    }
    
      static testMethod void testListCasesForCCManager(){
        test.startTest();
        User manager = createCCManager();
        Id managerRoleID = [select userroleid from user where id=: manager.id].UserRoleId;
        List<Case> casesList = new List<Case>();
        for(Integer i = 0; i < 3; i++){
            Case caseObj = new Case();
            caseObj.OwnerId =  manager.id;
            casesList.add(caseObj);
        }  
         insert casesList;  
        Set<ID> allSubRoleIds = CasesController.getAllSubRoleIds(new Set<ID>{managerRoleID});
        List<Case> cases = CasesController.getListCasesForCCManager();
        System.assertNotEquals(null, cases);
        test.stopTest();
     }
    
    static User createCCManager(){
        User manager;
        Id managerRoleID = [SELECT UserRoleId from User where userrole.name like :CC_MANAGER].UserRoleId;
        if(managerRoleID != null){
            manager = [select id from user where userroleid =:managerRoleID];
            system.debug('old manager');
        }
        else{
            Profile profileId = [SELECT Id FROM Profile WHERE Name =:STANDART_USER LIMIT 1];
  
             manager = new User(LastName = LAST_NAME,
                         FirstName= FIRST_NAME,
                         Alias = ALIAS,
                         Email = EMAIL,
                         Username = USERNAME,
                         ProfileId = profileId.id,
                         TimeZoneSidKey = TIME_ZONE_SID_KEY,
                         LanguageLocaleKey = LANGUAGE_LOCALE_KEY,
                         EmailEncodingKey = EMAIL_ENCODING_KEY,
                         LocaleSidKey = LOCALE_SID_KEY,
                         UserRoleId = managerRoleID
                         );
           insert manager;
           system.debug('new inserted CC Manager ID' + manager.id);
        }         
       return manager;
    }
   
}