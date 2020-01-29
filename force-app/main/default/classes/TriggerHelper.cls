public with sharing class TriggerHelper {
    public static void supplyStationNewDealsCounterHelper(List<Deal__c> insertedDeals){
        Set<Id> StationsIdSet = new Set<Id>();
        List<Supply_Station__c> StationsForUpdate = new List<Supply_Station__c>();
        if(insertedDeals!=null && insertedDeals.size()>0){
            for(Deal__c newDeal : insertedDeals){
                StationsIdSet.add(newDeal.Supplier__c);
            }
        }
        List<Supply_Station__c> stations = [SELECT Id, Name,(SELECT Id FROM Deals__r) FROM Supply_Station__c WHERE ID IN : StationsIdSet];
        for(Supply_Station__c station : stations){
            station.Deals_Number__c = station.Deals__r.size();
            StationsForUpdate.add(station);
        }

        update StationsForUpdate;
    }
    
    public static void supplyStationOldDealsCounterHelper(List<Deal__c> deletedDeals){
        Set<Id> StationsIdSet = new Set<Id>();
        List<Supply_Station__c> StationsForUpdate = new List<Supply_Station__c>();
        
        if(deletedDeals!=null && deletedDeals.size()>0){
            for(Deal__c removedDeal : deletedDeals){
                StationsIdSet.add(removedDeal.Supplier__c);
            }
        }
        List<Supply_Station__c> stations = [SELECT Id, Name,(SELECT Id FROM Deals__r) FROM Supply_Station__c WHERE ID IN : StationsIdSet];
        for(Supply_Station__c station : stations){
            station.Deals_Number__c = station.Deals__r.size();
            StationsForUpdate.add(station);
        }

        update StationsForUpdate;
    }
}
