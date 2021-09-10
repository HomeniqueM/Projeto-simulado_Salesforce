public class CaseTriggerHandler {
    
    public List<Case> casesToUpdate{get;set;}
    private Map<Id, Case> oldCases{get;set;} 
    private List<Case> newCases{get;set;} 
    
    
    public CaseTriggerHandler (Map<Id, Case> oldCases, List<Case> newCases ){ 
        this.casesToUpdate = new List<Case>();
        this.oldCases = oldCases;
        this.newCases = newCases;         
    }
    
    public static void iniciarTempoDeAtendimento( List <Case> listCase){        
        Entitlement entTemplate = [Select id From Entitlement Where Name = 'Suporte ao cliente'];
        
        for(Case c : listCase){
            c.EntitlementId = entTemplate.Id;
        }
        
    }
    
    public void FinalizarTempoDoAtendimento() {
        
        for(Case currCase : this.newCases) {
            Case oldCase = this.oldCases.get(currCase.Id);
            if(oldCase.Status != currCase.Status) {
                casesToUpdate.add(currCase);
            }
        }
        
        if(casesToUpdate.isEmpty()) {
            return;
        }
        
        CaseDomain caseManager = new CaseDomain(this.casesToUpdate);
        CaseMilestoneDomain caseMilestoneManager; 
        
        Set<Id> closedCases             = caseManager.getCaseIdByStatus('Closed');
        Set<Id> workingOrEscalatedCases = caseManager.getCaseIdByStatus('Working'); 
        
        caseMilestoneManager = new CaseMilestoneDomain(closedCases);
        caseMilestoneManager.addCaseMilestonesByCaseIds(workingOrEscalatedCases, 'Primeira resposta ao cliente');
        
        caseMilestoneManager.completeCaseMilestones();
        caseMilestoneManager.updateCaseMilestones();
        
    }
    
    
    public static void AdicionarALista(List <Case> listCase){ 
        User u = UserSelector.getCurrentUser();
        id IdQueue = FilaCasosPadrao__c.getOrgDefaults().OwnerId__c;
        // Teste com problemas resolver isso seriamente
        for( case c: listCase){
            if(site.getsiteId() != null){
                c.Origin = 'Portal do Cliente';
                c.OwnerId = IdQueue;
                c.ContactId = u.ContactId;
                
                
            }
        }
        
    }
    
}