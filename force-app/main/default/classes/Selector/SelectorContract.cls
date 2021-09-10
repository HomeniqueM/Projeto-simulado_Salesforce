public class SelectorContract {
    public static List<Contract> getContractComVecimento(Integer diaDoVecimento){
        Date vencimento = Date.today()+ diaDoVecimento;
        
        return [Select id, Name, AccountId, OwnerId, EndDate From  Contract Where EndDate = :vencimento And AccountId != Null ];
    }    
}