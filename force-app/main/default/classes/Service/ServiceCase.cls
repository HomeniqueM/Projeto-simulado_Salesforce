public class ServiceCase {
    
    public static void iniciarTempoDeAtendimento( List <Case> newCases){
        CaseDomain caseD = new CaseDomain(newCases);        
        Entitlement entTemplate = SelectorEntitlement.getTemplate('Suporte ao cliente');
        
        caseD.setEntitlemen(entTemplate);      
    }
    
    public static void FinalizarTempoDoAtendimento(List<Case> newCases,Map<Id, Case> oldCases) {
        
        CaseDomain caseD = new CaseDomain(newCases,oldCases);
        
        caseD.casesByStatusAndStatusChange('Closed');
        Set<Id> closedCases  =  caseD.getCaseId();
        
        caseD.clearRequested();
        
        caseD.casesByStatusAndStatusChange('Working');
        Set<Id> workingOrEscalatedCases = caseD.getCaseId();
        
        CaseMilestoneDomain caseMilestoneManager; 
        
        caseMilestoneManager = new CaseMilestoneDomain(closedCases);
        caseMilestoneManager.addCaseMilestonesByCaseIds(workingOrEscalatedCases, 'Primeira resposta ao cliente');
        
        caseMilestoneManager.completeCaseMilestones();
        caseMilestoneManager.updateCaseMilestones();
    }
    
    
    public static void AdicionarALista(List <Case> listCase){ 
        CaseDomain caseD = new CaseDomain(listCase);
        
        caseD.setSiteSource();
    }
    

    
}