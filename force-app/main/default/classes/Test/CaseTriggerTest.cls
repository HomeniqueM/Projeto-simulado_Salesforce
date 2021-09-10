@isTest 
class CaseTriggerTest {
    
    @isTest 
    private static void iniciarTempoDeAtendimentoTest(){
        Account acc = new Account (Name='Teste Serviço');
        insert acc;
        Entitlement entilTmp = new Entitlement ( Name='Suporte ao cliente', AccountId= acc.Id);
        insert entilTmp;
        FilaCasosPadrao__c IdDaFila = new FilaCasosPadrao__c();
        idDaFila.Name ='Filatest';
        idDaFila.OwnerId__c = '00G5e000000fOJrEAM';       
        insert IdDaFila;   
        
        Case ct = new Case();
        
        ct.Status ='New';
        ct.Origin = 'Email';
        
        Test.startTest();
        
        insert ct;
        Test.stopTest();
        
        Case insertCase = [SELECT Id, EntitlementId FROM Case LIMIT 1];
        
        Entitlement ent = [SELECT Name, Id FROM Entitlement WHERE Id = :insertCase.EntitlementId LIMIT 1];
        System.debug('Entilement: ' + ent.Name);
        System.assertEquals('Suporte ao cliente', ent.Name);        
        
        
    }
    
    
    @isTest
    private static void controlEndOfMilestonesTest() {
        
        Account a1 = new Account(Name='Teste Serviço');
        insert a1;
        Entitlement e1 = new Entitlement(Name='Suporte ao cliente', AccountId=a1.Id);
        insert e1;
        
        DireitoCustomizado__c configDireito = new DireitoCustomizado__c();
        configDireito.Name = 'Direito Customizado';
        configDireito.EntitlementId__c = e1.Id;
        
        insert configDireito;
        
        Case c1 = new Case();
        c1.Status = 'New';
        c1.Origin = 'Email';
        
        insert c1;
        
        Case c2 = new Case();
        c1.Status = 'New';
        c1.Origin = 'Email';
        
        insert c2;
        
        List<Case> insertCases = [SELECT Id, EntitlementId, Status FROM Case];
        
        insertCases.get(0).Status = 'Working';
        insertCases.get(1).Status = 'Closed';
        
        Test.startTest();
        update insertCases;
        Test.stopTest();
    }
    
    
    @isTest
    private static void validateCaseQueue (){
        

        Account acc = new Account (Name='Teste Serviço');
        insert acc;
        Entitlement entilTmp = new Entitlement ( Name='Suporte ao cliente', AccountId= acc.Id);
        insert entilTmp;
        FilaCasosPadrao__c IdDaFila = new FilaCasosPadrao__c();
        idDaFila.Name ='Filatest';
        idDaFila.OwnerId__c = '00G5e000000fOJrEAM';       
        insert IdDaFila;  
        
        
        
        Case ct = new Case();
        
        ct.Status ='New';
        ct.Origin = 'Portal do Cliente';
        
        Test.startTest();
        
        insert ct;
        Test.stopTest();
        
        Case insertCase = [SELECT Id,OwnerId ,EntitlementId FROM Case LIMIT 1];
        
        System.assertEquals(idDaFila.OwnerId__c, insertCase.OwnerId);        
        
    }
    
}