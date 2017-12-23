public class ApexDwolla_API_Test_Data {
    public static void createApiConfigData() {
        Dwolla_API_Connection__c connection = Dwolla_API_Connection__c.getOrgDefaults();
        connection.API_Endpoint__c  = 'http://localhost';
        connection.OAuth_Endpoint__c = 'http://localhost';
        connection.OAuth_Key__c = '123';
        connection.OAuth_Secret__c = 'abc';
        insert connection;
        
        Dwolla_API_Log_Level__c logLevel = Dwolla_API_Log_Level__c.getOrgDefaults();
        logLevel.Log_All__c = true;
        insert logLevel;
    }
}