trigger SurveyResponseTrigger on SurveyResponse (after update, after insert) {
    system.debug('Eu entrei na Trigger');
    
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
            SurveyResponseService.customerDoesNotRecommendTheService(Trigger.new);
        }
    }
    
}