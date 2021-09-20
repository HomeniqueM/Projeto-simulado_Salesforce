public class AccountDomain {
    public List<Account> requested {get;set;}
    private list <Account> accList {get;set;}
    
    public AccountDomain(){
        requested = new List<Account>();
        accList   = new List<Account>();
    }
    
    public AccountDomain(Set<id> ids){
        accList = SelectorAccount.getAccount(ids);
        requested = new List<Account>();
    }
    
    public void getAccountById(Set<id> ids){
        
        this.accList.addAll(SelectorAccount.getAccount(ids));               
    }
    
    
    public void accountAfterMonth(){
        
        for(Account a : accList){
            if(a.DataUltimaPesquisa__c == null ||a.DataUltimaPesquisa__c.addDays(30) >= Date.today()){
                requested.add(a);
            }
        }
        
    }
    
    
    public List<Contact> getContactsbyAccount(){
        List<Contact> lcon = new List<Contact>();
        
        for(Account a: accList){
            lcon.add(a.Contacts.get(0));
        }
        
        return lcon;
    }
    
    public void updateDateAccountList (){
        
        for(Account a : requested){
            a.DataUltimaPesquisa__c = Date.today(); 
        }
    }
    
    public void updateAccountList (){
        
        update requested;
    }
    
}