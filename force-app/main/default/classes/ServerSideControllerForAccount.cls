global class ServerSideControllerForAccount {
    @AuraEnabled
    public static List<Account> retrieveAccountDataByName(String input) {
        if(String.isNotBlank(input)){
            String forLikeQuery = '%'+input+'%';
            List<Account> accounts = [SELECT Id, Phone ,Name, Description, Industry, Rating FROM Account WHERE Name LIKE :forLikeQuery];
            return accounts;
        } else {
            List<Account> accounts = [SELECT Id, Phone ,Name, Description, Industry, Rating FROM Account];
            return accounts;
        }
    }
}