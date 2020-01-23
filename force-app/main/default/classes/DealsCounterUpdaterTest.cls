@isTest
private class DealsCounterUpdaterTest {
    @isTest static void TestNewDealUpdate() {
        Supply_Station__c myStation = new Supply_Station__c(Official_Name__c='Energy4',Address__c='xyz',Deals_Number__c=0);
        Customer__c custom = new Customer__c(Name='Garry',Debt__c=1001);
        insert myStation;
        insert custom;
        List<Supply_Station__c> stations = [SELECT ID FROM Supply_Station__c WHERE Official_Name__c='Energy4'];
        List<Customer__c> custms = [SELECT ID FROM Customer__c WHERE Name='Garry'];
        List<Deal__c> deals = new List<Deal__c>();
        deals.add(new Deal__c(Customer__c=custms[0].Id, Supplier__c=stations[0].Id, Type__c='Connection'));
        deals.add(new Deal__c(Customer__c=custms[0].Id, Supplier__c=stations[0].Id, Type__c='Connection'));

        Test.startTest();
        List<Database.Saveresult> results = Database.insert(deals, true);
        Test.stopTest();
        
        System.debug(results);
        List<Supply_Station__c> stationsTest = [SELECT ID, Deals_Number__c FROM Supply_Station__c WHERE Official_Name__c='Energy4'];
        System.assertEquals(2,stationsTest[0].Deals_Number__c);
    }
}