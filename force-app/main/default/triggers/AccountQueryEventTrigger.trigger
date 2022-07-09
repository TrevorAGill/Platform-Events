trigger AccountQueryEventTrigger on Account_Query__e (after insert) {
    for(Account_Query__e aq : Trigger.new) {
        AccountClass.gratuitousQuerying(null, aq.Account_Id__c);
        EventBus.TriggerContext.currentContext().setResumeCheckpoint(aq.replayId);
    }
}