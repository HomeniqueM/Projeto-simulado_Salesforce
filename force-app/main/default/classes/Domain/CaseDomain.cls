public class CaseDomain {
    
    public  List<Case> requested{set;get;}
    private Map<id,Case> oldCases{get;set;}
    private List<Case> newCases{get;set;}
    
    public CaseDomain(List<Case> cases) {
        this.newCases = cases;
        this.requested = new List<Case>();
    }
    
    public CaseDomain(List<Case> newCases,Map<id,Case> oldCases){
        this.newCases = newCases;
        this.oldCases = oldCases;
        this.requested = new List<Case>();
    }
    public Set<Id> getCaseAccountId(){
        Set<Id> result = new Set<Id>();
        
        for(Case c : requested) {  
            result.add(c.AccountId);             
        }
        
        return result; 
    }
    
    
    
    public Set<Id> getCaseId() {
        Set<Id> result = new Set<Id>();
        
        for(Case c : requested) {  
            result.add(c.Id);             
        }
        
        return result;
    }
    
    public void casesByStatusAndStatusChange(String status){
        
        for(Case currCase : newCases) {     
            Case oldCase = oldCases.get(currCase.Id);
            
            if((oldCase.Status != currCase.Status) && (currCase.status == status) ) {
                requested.add(currCase);
            }
        }
    }
    
    public void setSiteSource(){
        User u = UserSelector.getCurrentUser();
        id IdQueue = FilaCasosPadrao__c.getOrgDefaults().OwnerId__c;
        
        for( case c: this.newCases){
            if(site.getsiteId() != null){
                c.Origin = 'Portal do Cliente';
                c.OwnerId = IdQueue;
                c.ContactId = u.ContactId;              
                
            }
        }   
    }
    
    
    public void setEntitlemen(Entitlement entTemplate){
        
        for(Case c : newCases){
            c.EntitlementId = entTemplate.Id;
        }
    }
    
    
    public void clearRequested(){
        requested.clear();
    }
}