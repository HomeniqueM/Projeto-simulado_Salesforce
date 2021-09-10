trigger CaseTrigger on Case  (before insert,after update, after insert) {
	
	if(Trigger.isInsert){
		if(Trigger.isBefore){
			CaseTriggerHandler.iniciarTempoDeAtendimento(Trigger.new);
            CaseTriggerHandler.AdicionarALista(Trigger.new);
		}
	}else if(Trigger.isUpdate ){
		if(Trigger.isAfter){
        CaseTriggerHandler updateCases = new CaseTriggerHandler(Trigger.oldMap,Trigger.new);   
		updateCases.FinalizartempoDoAtendimento();
		}
	}

}