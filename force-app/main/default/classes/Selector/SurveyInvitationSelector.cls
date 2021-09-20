public class SurveyInvitationSelector {
    public static List<SurveyInvitation> getSurveyInvitationsById(Set<Id> invitations) {
        return [SELECT Id, InvitationLink FROM SurveyInvitation WHERE Id = :invitations];
    }
}