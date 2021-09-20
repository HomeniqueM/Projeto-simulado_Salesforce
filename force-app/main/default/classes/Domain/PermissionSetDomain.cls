public class PermissionSetDomain {
    
    
    public static void setPermissionSet(List<User> listAccount){
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        for (User u : listAccount){ 
            PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = '0PSq00000009qDNGAY', AssigneeId = u.Id);
            permissionSetList.add(psa);
        }
        try{
            upsert permissionSetList;
        }catch(exception e){
            system.debug('exception caught' + e);
        }
    }
}