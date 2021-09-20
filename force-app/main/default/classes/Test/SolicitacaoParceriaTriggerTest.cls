@isTest
public class SolicitacaoParceriaTriggerTest {
    @isTest
    static void partnerShipsApprovedTest(){
        
        PerfilParceiro__c pp = new PerfilParceiro__c();
        
        pp.Name                = 'Perfil Parceiro';
        pp.PerfilId__c         = '00e5e0000013ixNAAQ';
        pp.PermissionSetId__c  = '0PS5e000005xLVaGAM';
        
        insert pp;
        
        // Cria e insere a solicitação de parceria
        SolicitacaoParceria__c solicitation = new SolicitacaoParceria__c(nome__c= 'bidu',sobrenome__c ='01',email__c = 'aa@gmail.com',status__c = 'Em avaliação');
        insert solicitation;
        
        // atualiza e o status
        solicitation.status__c = 'Aprovada';       
        test.startTest();
        update solicitation;
        test.stopTest();
        
        // Recupe o contato 
        List<Contact> cont = [Select id, firstName from Contact];
        
        // Recupe o conta
        List<User> acc = [Select id, Name from User where firstname = 'bidu'];
        
        // Recuperar o contato
        system.assertEquals(1, cont.size());
        system.debug('size: '+ cont.size());
    
        system.assertEquals('bidu', cont.get(0).FirstName);
        
        system.debug('Acc size: '+ acc.size());
        system.assertEquals(1,acc.size());

        
        
        
    }
}