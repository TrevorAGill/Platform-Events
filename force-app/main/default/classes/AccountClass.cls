public class AccountClass {
    public static void gratuitousQuerying(List<Account> acctsFromTrigger, String accountId) {
        if (acctsFromTrigger != null) {
            for(Account acct : acctsFromTrigger) {
                for(Integer i=0; i<50; i++) {
                    Account newAccount = [SELECT Id, Name FROM Account WHERE Id = :acct.Id];
                    System.debug('Queried Account = ' + newAccount);
                }
            }
        } else {
            for(Integer i=0; i<50; i++) {
                Account newAccount = [SELECT Id, Name FROM Account WHERE Id = :accountId];
                System.debug('Queried Account = ' + newAccount);
            }
        }
    }
}
