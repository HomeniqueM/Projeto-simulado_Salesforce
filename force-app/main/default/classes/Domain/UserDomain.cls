public class UserDomain {
    
    private final String locale         = 'pt_BR';
    private final String encodingFormat = 'UTF-8';
    private final String timeZone       = 'America/Sao_Paulo';
    private String partnerProfileId;
    private id idPermissionSet;
    
    List<User> users = new List<User>();
    
    public UserDomain() {
        this.users = new List<User>();
        //this.partnerProfileId = PerfilParceiro__c.getOrgDefaults().PerfilId__c;
    }
    
    public void newUsersFromContacts(List<Contact> contacts) {
        
        for(Contact c : contacts) {
            User tmp = new User();
            
            tmp.ContactId         = c.Id;
            tmp.ProfileId          = this.partnerProfileId;            
            tmp.Username          = createUserName(c.FirstName, c.LastName);
            tmp.FirstName         = c.FirstName;
            tmp.LastName          = c.LastName;
            tmp.Alias             = createAlias(c.FirstName,c.LastName);
            tmp.MobilePhone       = c.MobilePhone;
            tmp.Email             = c.Email;
            tmp.CommunityNickname = c.Name;
            
            tmp.IsPortalEnabled   = true;
            
            tmp.EmailEncodingKey  = this.encodingFormat;
            tmp.TimeZoneSidKey    = this.timeZone;
            tmp.LocaleSidKey      = this.locale;
            tmp.LanguageLocaleKey = this.locale;
            
            tmp.IsActive = true;
            
            users.add(tmp);
        }
        

    }
    
    public void insertUsers() {
        if(this.users.size() != 0) {
            insert users;
        }
    }
    
    public String createAlias(String firstName, String lastName) {
        return firstName.left(firstName.length() / 2) + lastName.right(lastName.length() / 2);
    }
    
    public String createUserName(String firstName, String lastName) {
        return FirstName + '.' + LastName + Math.round(Math.random() * 100) + '@cupimExtermina.com';
    }
    
}