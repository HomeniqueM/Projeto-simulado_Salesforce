public class CaseMilestoneDomain {
    
    List<CaseMilestone> currCaseMilestones;
    
    public CaseMilestoneDomain(Set<Id> caseIds) {        
        this.currCaseMilestones = CaseMilestoneSelector.getCaseMilestonesById(
            caseIds
        );
    }
    
    public void addCaseMilestonesByCaseIds(Set<Id> caseIds, String milestoneName) {
        this.currCaseMilestones.addAll(
            CaseMilestoneSelector.getCaseMilestonesByIdAndName(
                caseIds, milestoneName
            )
        );
    }
    
    public void completeCaseMilestones() {
        Date now = Date.today();
        
        for(CaseMilestone cm : this.currCaseMilestones) {
            cm.CompletionDate = now;
        }
    }
    
    public void updateCaseMilestones() {
        if(this.currCaseMilestones.isEmpty()) {
            return;
        }
        update this.currCaseMilestones;
    }
}