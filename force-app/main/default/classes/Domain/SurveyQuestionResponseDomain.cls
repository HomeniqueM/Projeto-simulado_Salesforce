public class SurveyQuestionResponseDomain {
    public List<SurveyQuestionResponse> LSQR {get;set;}
    
    public SurveyQuestionResponseDomain( ){
        LSQR = new List<SurveyQuestionResponse>();        
    }
    
    
    public void setSurveyQuestionResponsesByIdFromResponse(Set<id> ids){
        LSQR = SurveyQuestionResponseSelector.getSurveyQuestionResponsesByIdFromResponse(ids);
    }
    
}