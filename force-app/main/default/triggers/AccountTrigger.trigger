trigger AccountTrigger on Account (after update) {
    /* 1. We hit a governor limit for excessive querying */
    AccountClass.gratuitousQuerying(Trigger.new, null);

    /* 2. Publish a list of events with checkpoint inserted after each successfully processed event */
    // List<Account_Query__e> acctsToQuery = new List<Account_Query__e>();
    // for(Account acct : Trigger.new) {
    //     acctsToQuery.add(new Account_Query__e(Account_Id__c = acct.Id));
    // }
    // EventBus.publish(acctsToQuery);

    /* 3. Run a queueable class */
    // ID jobID = System.enqueueJob(new TrevorQueueableClass());
}