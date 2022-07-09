public class TrevorQueueableClass implements Queueable {

    public List<Account> accountsFromTrigger = new List<Account>(); 

    public TrevorQueueableClass(List<Account> accts) {  
        this.accountsFromTrigger = accts; 
    }

    public void execute(QueueableContext context) { 

        // Can't queue 2 asynchronous jobs while in async context
        //System.enqueueJob(new TrevorQueueableClass(Trigger.new));
        //System.enqueueJob(new TrevorQueueableClass(Trigger.new));

        // But you can publish 2 platform events
        List<Launch_Async_Class__e> asyncJobEvents = new List<Launch_Async_Class__e>();
        asyncJobEvents.add(new Launch_Async_Class__e(Class_Name__c='ShakeItAllAboutQueueable'));
        asyncJobEvents.add(new Launch_Async_Class__e(Class_Name__c='DoTheHokeyPokeyQueueable'));
        EventBus.publish(asyncJobEvents); 
    } 

}