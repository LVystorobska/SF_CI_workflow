trigger DealToStationRelatedCounter on Deal__c (after insert, after delete) {
    map<Id, Integer> mapStationIdDealCount = new map<Id, Integer>();
    if(trigger.isInsert) {
        for(Deal__c deal : trigger.new) {
            Helper.supplyStationNewDealsCounterHelper(deal,mapStationIdDealCount);
        }
    } else {
        for(Deal__c deal : trigger.old) {
            Helper.supplyStationOldDealsCounterHelper(deal, mapStationIdDealCount);
        }
    }
    if(mapStationIdDealCount.size() > 0) {
        List<Supply_Station__c> listStations = [SELECT Id, Deals_Number__c FROM Supply_Station__c WHERE Id IN : mapStationIdDealCount.keySet()];
        for(Supply_Station__c station : listStations) {
            station.Deals_Number__c += mapStationIdDealCount.get(station.Id);
        }
        update listStations;
    }
}


