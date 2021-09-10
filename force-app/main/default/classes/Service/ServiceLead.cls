public class ServiceLead {
    
    public static void rotinaDePossiveisRenovacoes (){
        Integer diaParaVencer = 5;    
        LeadDomain leadD = new LeadDomain();
        ContractDomain contratos = new ContractDomain();        
        AssetDomain ativos  = new AssetDomain();

        contratos.ListadeIdPorContractsvencendo(diaParaVencer);
        ativos.ListadeIdPorAssetsvencendo(diaParaVencer);
        
        leadD.CreacaoDeLeadParaRenovacao(contratos, ativos);
        leadD.insertLead();
        
        // Enviar Email
        ServiceEnvioDeEmail.Enviar(leadD.novosLeads);
   		
        // Notificaçoes 
        ServiceNotificacao.sendNotification(leadD.novosLeads);
        
        // 2. Cria novos Leads 
        system.debug('Novos Leads:  ' + leadD.novosLeads.size());	   

        
    }
    
}