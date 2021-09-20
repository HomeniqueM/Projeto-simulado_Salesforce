public class SurveyQuestionResponseSelector {
    
    public static List<SurveyQuestionResponse> getSurveyQuestionResponsesByIdFromResponse(Set<Id> ids) {
        return [SELECT Id, ResponseId, QuestionId, QuestionChoiceId
                FROM SurveyQuestionResponse 
                WHERE ResponseId = :ids];
    }
    
}