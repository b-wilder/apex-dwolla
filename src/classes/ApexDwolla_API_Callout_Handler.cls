public class ApexDwolla_API_Callout_Handler {

    public static ApexDwolla_API_Wrapper.Session getSession(){
        Dwolla_API_Session__c savedSession = Dwolla_API_Session__c.getOrgDefaults();

        ApexDwolla_API_Wrapper.Session session;
        if(savedSession.Expiration_Time__c != NULL && DateTime.now() <= savedSession.Expiration_Time__c){
            session = new ApexDwolla_API_Wrapper.Session(
                savedSession.Authorization_Token__c,
                'bearer',
                savedSession.Expiration_Time__c
            );
            return session;
        }
        else{
            HttpResponse res = getSessionResponse();
            System.debug('res: ' + res);
            if(res != NULL && res.getStatusCode() == 200){
                String jsonResponse = res.getBody();

                session = ApexDwolla_API_Parser.parseGetSession(jsonResponse);
                session.setExpirationTime();
                session.setHttpResponse(res);
                
                updateSessionInfo(savedSession, session);
                return session;
            }
            else{
                return null;
            }
        }
    }
    
    public static HttpResponse getSessionResponse(){
        Dwolla_API_Connection__c  credentials = Dwolla_API_Connection__c.getOrgDefaults();

        // Instantiate a new http object
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        String requestBody =
            'client_id='+EncodingUtil.urlEncode(credentials.OAuth_Key__c, 'UTF-8') +
            '&client_secret='+EncodingUtil.urlEncode(credentials.OAuth_Secret__c, 'UTF-8') +
            '&grant_type='+EncodingUtil.urlEncode('client_credentials', 'UTF-8');
        HttpRequest req = ApexDwolla_API_Callout_Helper.buildHttpRequest(
            credentials.OAuth_Endpoint__c,
            'POST',
            new map<String,String>{'Content-Type' => 'application/x-www-form-urlencoded'},
            requestBody
        );
        
        // Send the request, and return a response
        HttpResponse res = ApexDwolla_API_Callout_Helper.makeCallout(h, req);
        return res;
    }

    public static void updateSessionInfo(Dwolla_API_Session__c savedSession, ApexDwolla_API_Wrapper.Session session){
        savedSession.Authorization_Token__c = session.access_token;
        savedSession.Expiration_Time__c = session.expiration_time;
        upsert savedSession;
    }
    //public static ApexDwolla_API_Wrapper.Account getAccountDetails(){
      //  return new ApexDwolla_API_Wrapper.Account();
    //}
}