public class AccountClass {
    public static void gratuitousQuerying(List<Account> acctsFromTrigger, String accountId) {
        if (acctsFromTrigger != null) {
            for(Account acct : acctsFromTrigger) {
                for(Integer i=0; i<50; i++) { // If more than 2 accounts are sent from the trigger, we will hit SOQL limit
                    Account newAccount = [SELECT Id, Name FROM Account WHERE Id = :acct.Id];
                    System.debug('We just queried for ' + newAccount.Name);
                }
            }
        } else {
            for(Integer i=0; i<50; i++) {
                Account newAccount = [SELECT Id, Name FROM Account WHERE Id = :accountId];
                System.debug('We just queried for ' + newAccount.Name + ' using platform events!');
            }
        }
    }
}
