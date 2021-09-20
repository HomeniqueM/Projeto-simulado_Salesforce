public class InvitationsDomain {
    public List<SurveyInvitation> surveyInvitations{get;set;}
    private List<Contact> contacts{get;set;}
    
    
    public InvitationsDomain(List<Contact> contacts){
        this.surveyInvitations = new List<SurveyInvitation>();
        this.contacts = contacts;    
    }
    
    public void UpdateInvitationsList(){
        Set<Id> invitations = new Set<Id>();
        
        
        for(SurveyInvitation s: surveyInvitations ){
            invitations.add(s.id);
        }
        surveyInvitations =  SurveyInvitationSelector.getSurveyInvitationsById(invitations);
    }
    
    
    public List<String> getInvitationsLink(){     
        List<String> links = new List<String>();
        
        for(SurveyInvitation s: surveyInvitations ){
            links.add(s.InvitationLink);
        }
        
        return links;
    }
    
    
    public void createNewInvitations(String invitationName) {
        
        for(Contact curr : this.contacts) {
            
            SurveyInvitation tmp = new SurveyInvitation();
            
            Id communityId       = PesquisaConstantes__c.getOrgDefaults().IdSiteComunidade__c;
            Id surveyId          = PesquisaConstantes__c.getOrgDefaults().IdPesquisa__c;
            Integer daysToExpire = (Integer)PesquisaConstantes__c.getOrgDefaults().DiasParaExpirar__c;
            
            tmp.ParticipantId                 = curr.Id;
            tmp.OwnerId                       = curr.OwnerId;
            tmp.OptionsAllowGuestUserResponse = true;
            tmp.Name                          = invitationName;
            tmp.InviteExpiryDateTime          = System.today() + daysToExpire;
            tmp.SurveyId                      = surveyId;
            tmp.CommunityId                   = communityId;
            
            this.surveyInvitations.add(tmp);
        }
    }
    
    public void insertSurveyInvitation(){
        insert this.surveyInvitations;
    }
}