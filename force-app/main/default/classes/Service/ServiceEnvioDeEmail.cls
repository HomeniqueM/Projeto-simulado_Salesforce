public class ServiceEnvioDeEmail {
    public static void Enviar(List<Lead> novosLeads) {
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>(); 
        EmailTemplate idTemplate = SelectorEmail.getEmailTemplate();
        for(Lead ld : novosLeads){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setTargetObjectId(ld.OwnerId);
            email.setTemplateId(idTemplate.id);
            email.setSenderDisplayName('Suporte');
            email.setSaveAsActivity(false);
            emailsToSend.add(email);
        }
        
        Messaging.sendEmail(emailsToSend);
    }
    
}