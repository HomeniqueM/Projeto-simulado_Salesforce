trigger CaseTrigger on Case (before insert,after update, after insert) {
	
	if(Trigger.isInsert){
		if(Trigger.isBefore){
			ServiceCase.iniciarTempoDeAtendimento(Trigger.new);
            ServiceCase.AdicionarALista(Trigger.new);
		}
	}else if(Trigger.isUpdate ){
		if(Trigger.isAfter){
       		ServiceCase.FinalizartempoDoAtendimento(Trigger.new,Trigger.oldMap);
        
		}
	}

}