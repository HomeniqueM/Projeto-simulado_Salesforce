public class ContactDomain {
    public List<Contact> contactList {get;set;}
    
    public ContactDomain (){
        this.contactList = new List<Contact>();
    }
    
    public void createContactFromPartnership(List<SolicitacaoParceria__c> partnerList){
        
        for(SolicitacaoParceria__c ipartner: partnerList){
            
            contactList.add(new Contact(
                firstName   = ipartner.nome__c,
                lastName    = ipartner.Sobrenome__c,
                Email       = ipartner.Email__c,
                MobilePhone =ipartner.Celular__c
            ));
            
        }
        
    }
    
    public void insertContatctList(){ 
        
        insert contactList;
    }
}