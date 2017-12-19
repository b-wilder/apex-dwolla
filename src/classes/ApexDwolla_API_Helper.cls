public class ApexDwolla_API_Helper {
    public static ApexDwolla_API_Wrapper.Session getAuthorizationToken(){
        
        Dwolla_API_Connection__c  credentials = Dwolla_API_Connection__c.getOrgDefaults();
        
        // Instantiate a new http object
        Http h = new Http();
    
         // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint(credentials.OAuth_Endpoint__c);
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        
        String requestBody = 
            'client_id='+EncodingUtil.urlEncode(credentials.OAuth_Key__c, 'UTF-8') +
            '&client_secret='+EncodingUtil.urlEncode(credentials.OAuth_Secret__c, 'UTF-8') +
            '&grant_type='+EncodingUtil.urlEncode('client_credentials', 'UTF-8');
        req.setBody(requestBody);
    
        // Send the request, and return a response
        String jsonResponse = ApexDwolla_API_Callout.makeCallout(h, req);
        ApexDwolla_API_Wrapper.Session session = ApexDwolla_API_Parser.parseGetAuthorizationToken(jsonResponse);
        session.setExpirationTime();
        System.debug(session);
        return session;
    }
    //public static ApexDwolla_API_Wrapper.Account getAccountDetails(){
      //  return new ApexDwolla_API_Wrapper.Account();
    //}
}