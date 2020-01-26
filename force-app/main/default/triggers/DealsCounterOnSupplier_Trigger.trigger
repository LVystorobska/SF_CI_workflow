trigger DealsCounterOnSupplier_Trigger on Deal__c(after insert, after delete){
    TriggerHelper.supplyStationNewDealsCounterHelper(Trigger.new, Trigger.old);
}