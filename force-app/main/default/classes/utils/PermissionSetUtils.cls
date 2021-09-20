public class PermissionSetUtils {
    
    @future
    public static void setUserPermission(set<id> ids,string name ){
        
        PermissionSet ps = PermissionSetSelector.getPermissionsSetByName(name);
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        
        for(Id i: ids){          
            permissionSetList.add(new PermissionSetAssignment( PermissionSetId = ps.id, AssigneeId = i));
            
        }
        
        insert permissionSetList;
    }
    
}