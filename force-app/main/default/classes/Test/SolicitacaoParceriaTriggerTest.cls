@isTest
public class SolicitacaoParceriaTriggerTest {
    @isTest
    static void partnerShipsApprovedTest(){
        
        // Cria e insere a solicitação de parceria
        SolicitacaoParceria__c solicitation = new SolicitacaoParceria__c(nome__c= 'Teste',sobrenome__c ='01',email__c = 'aa@gmail.com',status__c = 'Em avaliação');
        insert solicitation;
        
        // atualiza e o status
        solicitation.status__c = 'Aprovada';       
        test.startTest();
        update solicitation;
        test.stopTest();
        
        // Recupe o contato 
        
        List<Contact> cont = [Select id, firstName from Contact];
        
        //system.debug(cont.get(0).FirstName);
        system.assertEquals(1, cont.size());
        system.assertEquals('Teste', cont.get(0).FirstName);
        
        
        
        
    }
}