public with sharing class Helper {
    public static void supplyStationNewDealsCounterHelper(Deal__c insertedDeal, map<Id, Integer> mapStationIdDealCount){
            if(insertedDeal.Supplier__c!=null){
            if(!mapStationIdDealCount.containsKey(insertedDeal.Supplier__c)) {
                    mapStationIdDealCount.put(insertedDeal.Supplier__c, 1);
                } else {
                    mapStationIdDealCount.put(insertedDeal.Supplier__c, mapStationIdDealCount.get(insertedDeal.Supplier__c) + 1);
                }
            }
    }
    
    public static void supplyStationOldDealsCounterHelper(Deal__c deletedDeal, map<Id, Integer> mapStationIdDealCount){
            if(deletedDeal.Supplier__c!=null){
            if(!mapStationIdDealCount.containsKey(deletedDeal.Supplier__c)) {
                mapStationIdDealCount.put(deletedDeal.Supplier__c, -1);
            } else {
                mapStationIdDealCount.put(deletedDeal.Supplier__c, mapStationIdDealCount.get(deletedDeal.Supplier__c) - 1);
                }
            }
    }
}
}
