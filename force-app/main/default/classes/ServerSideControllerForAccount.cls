global class ServerSideControllerForAccount {
    @AuraEnabled
    public static List<Account> retrieveAccountDataByName(String input) {
        List<Account> accounts = [SELECT Id, Phone ,Name, Description, Industry, Rating FROM Account WHERE Name=:input];
        return accounts;
    }
}