public class ServiceNotificacao {
    public static void sendNotification(List<Lead> newLeads) {
        
        System.debug('entrou no sendNotification');
        Map<Id, Integer> destination = new Map<Id, Integer>();
        
        for(Integer i=0;i<newLeads.size();i++) {
            if(destination.containsKey(newLeads[i].ownerId)){
                destination.put(newLeads[i].ownerId,destination.get(newLeads[i].ownerId)+1);
            } else {
                destination.put(newLeads[i].ownerId,1);
            }
        }
        System.debug('O mapa de owner e quantidade' + destination);
        
        CustomNotificationType type = SelectorNotificacao.CustomNotificationType();
        System.debug('tipo de notificacao' + type);
        Messaging.CustomNotification notify = new Messaging.CustomNotification();
        
        for(Id key: destination.keySet()){
            notify.setTitle('Novo(s) lead(s) criado(s)');
            notify.setBody(destination.get(key)+' leads foram criados');
            notify.setTargetId(key);
            notify.setNotificationTypeId(type.id);
            System.debug('Notificacao: '+ notify);
            notify.send(new Set<String> {key});
        }
        
        System.debug('saiu da notificacao service');
        
    }    }