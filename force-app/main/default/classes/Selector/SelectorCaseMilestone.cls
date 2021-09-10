public  class SelectorCaseMilestone {
    // Ver com o Lopes
    public static List<CaseMilestone> getCaseMilestonesById(Set<Id> caseIds) {
        return [SELECT Id, CaseId, IsCompleted, CompletionDate, MilestoneType.Name
                FROM CaseMilestone
                WHERE CaseId = :caseIds];
    }
    
    public static List<CaseMilestone> getCaseMilestonesByIdAndName(Set<Id> caseIds, String milestoneName) {
        return [SELECT Id, CaseId, IsCompleted, CompletionDate, MilestoneType.Name
                FROM CaseMilestone
                WHERE CaseId = :caseIds
                AND MilestoneType.Name = :milestoneName];
    }
}