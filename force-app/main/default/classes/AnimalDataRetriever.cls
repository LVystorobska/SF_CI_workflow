public with sharing class AnimalDataRetriever {
    public static Object getAndCreateAnimalDataById(Integer animalId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Animal> result = (Map<String, Animal>) JSON.deserialize(response.getBody(), Map<String, Animal>.class);
            Animal resultedAnimal = result.get('animal');
           	Animal__c animalForStore = new Animal__c(CallOut_Id__c=resultedAnimal.id, Name=resultedAnimal.name, Feed__c=resultedAnimal.eats, Sound__c=resultedAnimal.says);
            insert animalForStore;
            return resultedAnimal;
        } else {
            return null;
        }
    }
}
