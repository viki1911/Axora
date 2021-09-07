@isTest
private class LeadsRemovalTest {
    @TestSetup
    public static void makeData(){
       Lead testLead1 = new Lead(
           LastName = 'Test Name',
           CurrencyIsoCode = 'USD',
           Company = 'Axora',
           Status = 'New',
           Email = 'test@axora.com'
       );
       
       Lead testLead2 = new Lead(
           LastName = 'Test Name',
           CurrencyIsoCode = 'USD',
           Company = 'Axora',
           Status = 'New',
           Phone = '99*99*99'
       );
       
       insert new List<Lead>{testLead1, testLead2};
    }

    static testMethod void testLeadsRemoval() {        
        test.starttest();
            LeadsRemovalScheduler lrs = new LeadsRemovalScheduler ();   
            String CRON_EXP = '0 0 23 * * ?';        
            String jobId = System.schedule('Test Schedule', CRON_EXP, lrs);
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
        test.stopTest();
    }
}