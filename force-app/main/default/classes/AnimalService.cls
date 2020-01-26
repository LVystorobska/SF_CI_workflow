@RestResource(urlMapping='/animals/*')
global with sharing class AnimalService {
    @HttpGet
    global static Id getCaseById() {
        RestRequest request = RestContext.request;
        Integer externalId = Integer.ValueOf(request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1));
        try{
        	Animal__c result =  [SELECT Id FROM Animal__c WHERE CallOut_Id__c = :externalId];
            return result.Id;
        } catch (System.QueryException ex) {
            AnimalDataRetriever.getAndCreateAnimalDataById(externalId);
            Animal__c loopedResult =  [SELECT Id FROM Animal__c WHERE CallOut_Id__c = :externalId];
            return loopedResult.id;
        }
    }
}