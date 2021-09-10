trigger SolicitacaoParceriaTrigger on SolicitacaoParceria__c (after update) {
    
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
           
        	ServiceSolicitacaoParceria.partnerShipsApproved(Trigger.new,Trigger.oldMap);
  
        }
    }
}