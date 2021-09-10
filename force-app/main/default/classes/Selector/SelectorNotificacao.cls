public class SelectorNotificacao {
    
    public static CustomNotificationType CustomNotificationType (){
        return [SELECT Id FROM CustomNotificationType WHERE DeveloperName='NotificaoAcompanhamentoCliente' LIMIT 1];
    }
}