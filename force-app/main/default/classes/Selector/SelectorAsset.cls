public class SelectorAsset {
    public static List<Asset> getAssetComVecimento(Integer diaDoVecimento){
        Date vencimento = Date.today()+diaDoVecimento;
        system.debug('Dia do Vencimento: '+ vencimento);
        return[Select Id, Name, AccountId, OwnerId From Asset Where UsageEndDate = :vencimento And AccountId != Null];      
    } 
    

}