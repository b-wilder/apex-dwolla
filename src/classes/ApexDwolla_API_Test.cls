@isTest
global class ApexDwolla_API_Test {
	@isTest static void testGetSessionSuccess() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ApexDwolla_API_Test_Mock.GetSessionSuccess()); 
        ApexDwolla_API_Wrapper.Session session = ApexDwolla_API_Callout_Handler.getSession();
        
        System.assert(session.res != null, 'Null session returned');
        HttpResponse res = session.res;
        
        System.assertEquals('application/json', res.getHeader('Content-Type'));
        System.assertEquals(ApexDwolla_API_Test_JSON.GET_SESSION_JSON, res.getBody());
        System.assertEquals(200, res.getStatusCode());
        
        System.assert(session.access_token.length() == 36, 'Invalid access_token returned: ' + session.access_token);
        try{
            Date d = session.expiration_time.date();
            Time t = session.expiration_time.time();
        }
        catch (Exception e) {
            System.assert(FALSE, 'session.expiration_time was an invalid DateTime: ' + session.expiration_time);
        }
        DateTime oldExpirationTime = session.expiration_time;
        
        session = ApexDwolla_API_Callout_Handler.getSession();
        System.assert(session.access_token.length() == 36, 'Invalid access_token returned: ' + session.access_token);
        System.assert(session.expires_in == NULL, 'API call was made when it the session was already saved');
        //expiration_time should not have changed because it was saved.
        System.assertEquals(oldExpirationTime, session.expiration_time);
    }
}