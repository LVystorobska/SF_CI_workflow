trigger DealsCounterOnSupplier on Deal__c(after insert, after delete){
    Helper.supplyStationNewDealsCounterHelper(Trigger.new, Trigger.old);
}