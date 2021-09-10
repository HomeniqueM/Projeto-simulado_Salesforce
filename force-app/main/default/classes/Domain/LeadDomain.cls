public class LeadDomain {
    public List<Lead> novosLeads;
    
    public LeadDomain(){ 
        novosLeads = new List<Lead>();
    }
    
    private static final string LEAD_ORIGIN = 'Acompanhamento do cliente';
    private static final string LEAD_STATUS = 'Working';
    
    // Funcao para criar os novos Leads 
    public static Lead novoLead (string firstName, string lastName , string name, string email, id owner ){
        Lead l = new lead();
        l.FirstName = firstName;
        l.LastName = lastName;
        l.Company = name;
        l.Email = email;
        l.OwnerId = owner;   
        l.LeadSource = LEAD_ORIGIN;
        l.Status = 'Working';     
        return l;
    }
    
    public void CreacaoDeLeadParaRenovacao(ContractDomain contratos , AssetDomain ativos  ){
        Set<id> accId = new Set<id>();
        List<Account> accounts =  new List<Account>();
        Map<id,Account> mapIdAcc;
        List<SObject> sobj = new List<SObject>();
        
        // Adiciona ao sOject Generico
        sobj.addAll(contratos.contratos);
        sobj.addAll(ativos.ativos);
        
        // Carrega todos os AccountId
        accId.addAll(contratos.GetAccoundId());
        accId.addAll(ativos.GetAccoundId());
        
        // Carrega todas as Account
        accounts = SelectorAccount.getAccount(accId);
        mapIdAcc = new Map <id,Account>(accounts);
        
        // Iterando pelo itens da List de Sobject
        for(SObject a : sobj ){ 
            Account tmp = mapIdAcc.get((Id)a.get('AccountId'));
            
            if( tmp.contacts.size() > 0){
                
                novosLeads.add(novoLead(tmp.contacts[0].FirstName, tmp.contacts[0].LastName, tmp.name, tmp.contacts[0].email, tmp.OwnerId) );
            }else{
                novosLeads.add(novoLead('', tmp.name, tmp.name, '', tmp.OwnerId));
            }
        }
        
    }
    
    public void insertLead(){
        insert novosLeads;
    }
    
}