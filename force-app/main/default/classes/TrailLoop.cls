public class TrailLoop {
   
 
    
    //Here is a combined problem of a query that needs a filter
    //and a loop that continually calls out to the database
    public static void AllBadThings(Account a) {
        List<Task> allMyTasks = [Select Id, status, whatId From Task];
        for (Task t : allMyTasks) {
            if (t.whatId == a.id) {
                t.status = 'Completed';
                update t;
            }
        }
    }
    
        public static void AllGoodThings(Account a) {
        List<Task> allMyTasks = [Select Id, status, whatId From Task Where whatId = :a.id ];
        for (Task t : allMyTasks) {
                t.status = 'Completed';
            }
        
        update allMyTasks;
        }
    
   
    
}