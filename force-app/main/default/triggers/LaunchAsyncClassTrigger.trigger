// Credit to Ohad Idan, Praxis LLC, for this trigger code.

trigger LaunchAsyncClassTrigger on Launch_Async_Class__e (after insert) {
    for(Launch_Async_Class__e event : trigger.new){
        if(String.isNotBlank(event.Class_Name__c)){
            Type classType = Type.forName(event.Class_Name__c); // Get class type from the class name
            Object classInstance = classType.newInstance(); // Instantiate the class type as a generic object
            if(classInstance instanceof Database.Batchable<sObject>) { // Use instanceof keyword to determine if the class is a batchable class, then execute the batch
                    Database.executeBatch((Database.Batchable<sObject>) classInstance,event.Batch_Size__c==null?200:event.Batch_Size__c.intValue());
            } else if (classInstance instanceof System.Queueable) { // If the instantiated class is a queueable class, enqueue a job
                    System.enqueueJob((System.Queueable) classInstance);
            }
        }
        EventBus.TriggerContext.currentContext().setResumeCheckpoint(event.replayId); // We can call 50 queueable classes from this trigger context. If we hit the limit, this saves a checkpoint
    }
}