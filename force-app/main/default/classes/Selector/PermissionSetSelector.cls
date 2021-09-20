public class PermissionSetSelector {
    public static PermissionSet getPermissionsSetByName(string namePermission){
        return [SELECT Id, Name, Label, ProfileId,IsCustom FROM PermissionSet WHERE name =:namePermission LIMIT 1];
        
    }
}