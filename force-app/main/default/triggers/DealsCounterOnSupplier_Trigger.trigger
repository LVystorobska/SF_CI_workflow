trigger DealsCounterOnSupplier_Trigger on Deal__c(after insert, after delete){
    if(Trigger.isInsert){
      TriggerHelper.supplyStationNewDealsCounterHelper(Trigger.new);
    }
    
    if(Trigger.isDelete){
      TriggerHelper.supplyStationOldDealsCounterHelper(Trigger.old);
    }
}