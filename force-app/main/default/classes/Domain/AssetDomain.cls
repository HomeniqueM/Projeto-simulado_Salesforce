public class AssetDomain {
    public List<Asset> ativos{get;set;}
    
    public AssetDomain ( ){ 
        ativos =  new List<Asset> ();       

    }
    
    public void ListadeIdPorAssetsvencendo(Integer diaParaVencer){
        this.ativos = SelectorAsset.getAssetComVecimento(diaParaVencer);        
    }

    public Set<id> GetAccoundId (){
        Set <id> setIds = new set<id>();
        for(Asset a:  this.ativos){
            setIds.add(a.AccountId);
        }
        return setIds;
    } 
    

    
    
}