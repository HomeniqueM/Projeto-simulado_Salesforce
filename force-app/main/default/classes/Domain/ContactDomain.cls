public class ContactDomain {
    public List<Contact> contactList {get;set;}
    
    public ContactDomain (){
        this.contactList = new List<Contact>();
    }
    
    
    public ContactDomain (List<Contact> contactList){
        this.contactList =contactList;
    }
    
    
    public void createContactFromPartnership(List<SolicitacaoParceria__c> partnerList){
        if(!partnerList.isEmpty()){ 
            
            for(SolicitacaoParceria__c ipartner: partnerList){ 
                contactList.add(new Contact(
                    firstName   = ipartner.nome__c,
                    lastName    = ipartner.Sobrenome__c,
                    Email       = ipartner.Email__c,
                    MobilePhone = ipartner.Celular__c,
                    accountId   = Label.IdContaParceiro
                    
                ));
                
            }
        }
        
    }
    
    public void insertContatctList(){ 
        if(contactList.size() != 0){
            insert contactList;
        }
    }
    public void updateContatctList(){
        if(contactList.size() != 0){
            update contactList;
        }
    }
    
    
    public void insertInvitationLink(List<String> link){
        System.debug('Eu vou colocar os link no contato:');
        integer size = link.size();
        for(integer i = 0 ; i < size; i++){
            contactList.get(i).LinkPesquisa__c = link.get(i);
            
        }
    }
    
    
}