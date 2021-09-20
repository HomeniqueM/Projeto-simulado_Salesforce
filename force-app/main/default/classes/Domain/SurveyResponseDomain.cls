public class SurveyResponseDomain {
    public List<SurveyResponse> requested{get;set;}
    
    
    public SurveyResponseDomain (List<SurveyResponse> requested){
        this.requested = requested;
    }
    
    
    public void chooseByStatus (String status){ 
        List<SurveyResponse> tmp = new List<SurveyResponse>();
       
        for( SurveyResponse sr : requested){
            if(sr.Status == status){
                tmp.add(sr);
            }
        }
        
        requested = tmp;
    }
    
    
    public Set<id> GetSetResponseIds(){
        Set<id> ids = new Set<id>();
        
        for(SurveyResponse sr : requested){
            ids.add(sr.Id);
        }
        
        return ids;
    }
}