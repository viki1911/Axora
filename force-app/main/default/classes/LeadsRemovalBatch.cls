public class LeadsRemovalBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id FROM Lead WHERE Email LIKE ' + '\'' + '%@axora.com%' + '\'' + 'OR Phone LIKE ' + '\'' + '%99*99*99%'  + '\'';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<Lead> leads) {
        try {
            if (leads != null && !leads.isEmpty()) {
                delete leads;
            }
        } catch(Exception e) {
            system.debug(e);
        }
    }
    public void finish(Database.BatchableContext BC) {
    }
}