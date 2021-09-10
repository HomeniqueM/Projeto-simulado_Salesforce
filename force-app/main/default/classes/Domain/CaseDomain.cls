public class CaseDomain {
    
    public List<Case> currCases{set;get;}
    
    public CaseDomain(List<Case> cases) {
        this.currCases = cases;
    }
    
    public Set<Id> getCaseIdByStatus(String status) {
        Set<Id> result = new Set<Id>();
        
        for(Case c : currCases) {
            if(c.Status == status) {
                result.add(c.Id);
            }    
        }
        
        return result;
    }
}