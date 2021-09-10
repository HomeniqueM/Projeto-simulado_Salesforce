public class ServiceSolicitacaoParceria {
    
    public static void partnerShipsApproved(List<SolicitacaoParceria__c> listOfSolicitation, Map<id,SolicitacaoParceria__c> mapOldSolicitation){ 
        
        SolicitacaoParceriaDomain approved = new SolicitacaoParceriaDomain(listOfSolicitation,mapOldSolicitation);
        
        approved.generateListFromStatus('Aprovada');
        
        approved.ConverteToContract();
    }
    
}