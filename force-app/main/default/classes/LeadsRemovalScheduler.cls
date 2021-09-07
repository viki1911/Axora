public class LeadsRemovalScheduler implements Schedulable {
   public void execute(SchedulableContext SC) {
      LeadsRemovalBatch lrb = new LeadsRemovalBatch();
      database.executebatch(lrb);
   }
}