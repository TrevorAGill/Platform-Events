public class TrevorQueueableClass implements Queueable {

    public void execute(QueueableContext context) { 

        // Can't queue 2 asynchronous jobs while in async context
        System.enqueueJob(new ShakeItAllAboutQueueable());
        System.enqueueJob(new DoTheHokeyPokeyQueueable());

        // But you can publish 2 platform events; in fact, you can add up to 50 queueable jobs
        // List<Launch_Async_Class__e> asyncJobEvents = new List<Launch_Async_Class__e>();
        // asyncJobEvents.add(new Launch_Async_Class__e(Class_Name__c='ShakeItAllAboutQueueable'));
        // asyncJobEvents.add(new Launch_Async_Class__e(Class_Name__c='DoTheHokeyPokeyQueueable'));
        // EventBus.publish(asyncJobEvents); 
    } 

}