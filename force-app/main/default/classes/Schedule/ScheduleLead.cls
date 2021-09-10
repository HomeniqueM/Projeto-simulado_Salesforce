public class ScheduleLead implements Schedulable {
  public void execute(SchedulableContext ctx){
    ServiceLead.rotinaDePossiveisRenovacoes();
  }
    
 public static void startJob(){
        System.schedule('ScheduleLeadCreation', '0 0 8 * * ?', new ScheduleLead());   
    }

    public static void deleteJob(){
        List<CronTrigger> jobs = [SELECT Id from CronTrigger where CronJobDetail.Name like 'ScheduleLeadCreation'];
        
        for(CronTrigger job : jobs){
            System.abortJob(job.Id);
        }
    }
  
}