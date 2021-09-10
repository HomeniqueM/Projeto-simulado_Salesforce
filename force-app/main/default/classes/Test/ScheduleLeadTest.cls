@isTest 
public class ScheduleLeadTest {
    @isTest static void rotinaDePossiveisRenovacoesTest() {
        
        // Inserir contas no sistema
        
        List<Account> accounts = new List<Account>();
        Account acc1 = new Account(Name='Teste1');
        accounts.add(acc1);
        
        Account acc2 = new Account(Name='Teste2');
        accounts.add(acc2);
        
        Account acc3 = new Account(Name='Teste3');
        accounts.add(acc3);
        
        insert accounts;
        
        Contact ctc = new Contact(LastName='Teste2Contact', AccountId=acc2.OwnerId, Email='teste@email.com');
        
        // Inserir ativos no sistema
        
        List<Asset> assets = new List<Asset>();
        Date vencimento = Date.today()+5; //Data de vencimento e verificado como 5 dias depois do dia atual
        
        Asset a1 = new Asset(
            Name='AssetTeste1',
            AccountId=acc1.Id,
            UsageEndDate=vencimento);
        assets.add(a1);
        
        Asset a2 = new Asset(
            Name='AssetTeste1',
            AccountId=acc2.Id,
            UsageEndDate=vencimento);
        assets.add(a2);
        
        Asset a3 = new Asset(
            Name='AssetTeste1',
            AccountId=acc3.Id,
            UsageEndDate=vencimento);
        assets.add(a3);    
        
        insert assets;
        
        // Inserir Contratos
        List<Contract> contracts = new List<Contract>();
        
        Integer periodicidade = 5;
        Date inicioContrato   = vencimento.addMonths(-periodicidade) +1;
    
    
        
        Contract c1 = new Contract(
            AccountId=acc1.Id, 
            Status='Rascunho', 
            StartDate=inicioContrato, 
            ContractTerm = periodicidade);
        contracts.add(c1);
        
        Contract c2 = new Contract(
            AccountId=acc2.Id,
            Status='Rascunho',
            StartDate=inicioContrato,
            ContractTerm = periodicidade);
        
        contracts.add(c2);
        
        Contract c3 = new Contract(
            AccountId=acc3.Id,
            Status='Rascunho',
            StartDate=inicioContrato,
            ContractTerm = periodicidade);
        contracts.add(c3);
        
        insert contracts;
        
        Test.startTest();
        ScheduleLead.startJob();
        Test.stopTest();
        
        ScheduleLead.deleteJob();
        
        List<Lead> createdLeads = [SELECT Id FROM Lead];
        
        System.assertEquals(6, createdLeads.size());
    }
}