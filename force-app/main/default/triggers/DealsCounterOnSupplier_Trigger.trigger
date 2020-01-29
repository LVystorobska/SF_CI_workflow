trigger DealsCounterOnSupplier_Trigger on Deal__c(after insert, after delete){
    if(Trigger.isInsert){
		Helper.supplyStationNewDealsCounterHelper(Trigger.new);
    }
    
    if(Trigger.isDelete){
		Helper.supplyStationOldDealsCounterHelper(Trigger.old);
    }
}