public class CasesController {
 public static final String CC_MANAGER = 'CC Manager%';
public static List<Case> getListCasesForBoss() {
    List<Case> results = [SELECT  CaseNumber,Status,
                                  Owner.FirstName,Owner.LastName FROM Case 
                                  WHERE CreatedDate = LAST_N_DAYS:7];
    return results;
}
    
public static List<Case> getListCasesForCCManager() {
       Id managerRoleID = [SELECT UserRoleId from User where userrole.name like :CC_MANAGER].UserRoleId;
       Set<Id> allSubRoleIds = getAllSubRoleIds(new Set<ID>{managerRoleID});
       List<Case> cases = [SELECT CaseNumber,Status,Owner.FirstName,
                                   Owner.LastName FROM Case 
                                   WHERE (Owner.Id IN : allSubRoleIds AND CreatedDate = LAST_N_DAYS:7)];
       return cases;
}
    public static Set<ID> getAllSubRoleIds(Set<ID> roleIds) {
    Set<ID> currentRoleIds = new Set<ID>();
    // get all of the roles underneath the passed roles
    for(UserRole userRole :[SELECT Id from UserRole where ParentRoleId 
                            IN :roleIds AND ParentRoleID != null]){
                                    currentRoleIds.add(userRole.Id);
                            }
    if(currentRoleIds.size() > 0)
      currentRoleIds.addAll(getAllSubRoleIds(currentRoleIds));
    return currentRoleIds;
  }
}