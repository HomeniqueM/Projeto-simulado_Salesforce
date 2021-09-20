public class ServiceSolicitacaoParceria {
    
    public static void partnerShipsApproved(List<SolicitacaoParceria__c> listOfSolicitation, Map<id,SolicitacaoParceria__c> mapOldSolicitation){ 
        
        // Recuperar lista de solicitações de Parceria que o status mudou para "Aprovada"  
        SolicitacaoParceriaDomain solicitacaoD = new SolicitacaoParceriaDomain(listOfSolicitation,mapOldSolicitation);
        solicitacaoD.getListFromStatus('Aprovada');
        
        system.debug('Requested size: ' + solicitacaoD.requested.size());
        if(solicitacaoD.requested.size() == 0){
            
            return ;
        }
        
        // Cria e inseri contato a partir solicitacao de parceria 
        ContactDomain contactD = new ContactDomain(); 
        contactD.createContactFromPartnership(solicitacaoD.requested);
        contactD.insertContatctList();
        
        // Cria e inseri usuário a partir do contato
        UserDomain userD = new UserDomain();
        userD.newUsersFromContacts (contactD.contactList);
        userD.insertUsers();
        
        // inseri usuário a regra personalizada
        PermissionSetUtils.setUserPermission(userD.getSetIds(), 'Parceiros');
        
    }
    
}