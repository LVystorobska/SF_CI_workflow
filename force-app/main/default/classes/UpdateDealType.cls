global class UpdateDealType implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsUpdated = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Debt__c, (SELECT ID, Type__c FROM Deals__r) FROM Customer__c Where Debt__c > 1000'
        );
    }
    global void execute(Database.BatchableContext bc, List<Customer__c> scope){
        List<Deal__c> deals = new List<Deal__c>();
        for (Customer__c customer : scope) {
            for (Deal__c deal : customer.deals__r) {
                deal.Type__c = 'Blackout';
                deals.add(deal);
                recordsUpdated = recordsUpdated + 1;
            }
        }
        update deals;
    }    
    global void finish(Database.BatchableContext bc){
        System.debug(recordsUpdated + ' records updated.');
    }    
    
}