public class ContractDomain {
    public List<Contract> contratos {get;set;}
    public ContractDomain (){
        this.contratos = new List<Contract>();
    }
    
    public void ListadeIdPorContractsvencendo(Integer diaParaVencer){
        this.contratos = SelectorContract.getContractComVecimento(diaParaVencer);               
    }
    
  
    public Set<id> GetAccoundId (){
        Set <id> setIds = new set<id>();
        for(Contract c : this.contratos){
            setIds.add(c.AccountId);
        }
        return setIds;
    } 
  
}