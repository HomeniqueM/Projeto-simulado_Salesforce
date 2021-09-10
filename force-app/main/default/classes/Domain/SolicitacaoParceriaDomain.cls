public class SolicitacaoParceriaDomain {
    
    public List<SolicitacaoParceria__c> listOfSolicitation {get;set;}
    public Map<id,SolicitacaoParceria__c> mapOldSolicitation {get;set;}
    private List<SolicitacaoParceria__c> solicitationApproved =  new List<SolicitacaoParceria__c>();
    
    
    public SolicitacaoParceriaDomain(List<SolicitacaoParceria__c> listOfSolicitation, Map<id,SolicitacaoParceria__c> mapOldSolicitation ){
        this.listOfSolicitation = listOfSolicitation;
        this.mapoldSolicitation = mapOldSolicitation; 
    }
    
    
    public void generateListFromStatus(String status){
        
        
        for(SolicitacaoParceria__c sp : listOfSolicitation){
            
            if(!this.mapOldSolicitation.containsKey(sp.Id)){
                continue;
            }
            
            SolicitacaoParceria__c old = this.mapOldSolicitation.get(sp.Id);
            
            if( old.Status__c != sp.Status__c && sp.Status__c == status){
                solicitationApproved.add(sp);
            }
            
        }
        
    }
    
    public void ConverteToContract ( ){ 
        ContactDomain cont = new ContactDomain();
        
        cont.createContactFromPartnership(solicitationApproved);
        cont.insertContatctList();
    }
}