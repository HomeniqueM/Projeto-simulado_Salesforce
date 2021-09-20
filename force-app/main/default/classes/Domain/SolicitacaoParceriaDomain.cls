public class SolicitacaoParceriaDomain {
    
    public List<SolicitacaoParceria__c> listOfSolicitation {get;set;}
    public Map<id,SolicitacaoParceria__c> mapOldSolicitation {get;set;}
    public List<SolicitacaoParceria__c> requested {get;set;}
    
  
    public SolicitacaoParceriaDomain(List<SolicitacaoParceria__c> listOfSolicitation, Map<id,SolicitacaoParceria__c> mapOldSolicitation ){
        this.listOfSolicitation = listOfSolicitation;
        this.mapoldSolicitation = mapOldSolicitation; 
        this.requested =  new List<SolicitacaoParceria__c>( );
    }
    
    
    public void getListFromStatus(String status){
        
        
        for(SolicitacaoParceria__c sp : listOfSolicitation){
            
            if(!this.mapOldSolicitation.containsKey(sp.Id)){
                continue;
            }
            
            SolicitacaoParceria__c old = this.mapOldSolicitation.get(sp.Id);
            
            if( old.Status__c != sp.Status__c && sp.Status__c == status){
                requested.add(sp);
            }
            
        }
       system.debug('Criando a lista baseada no status ');
    }
    
}