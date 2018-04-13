@isTest
global class ApexDwolla_API_Test {
	@isTest static void testGetSessionSuccess() {
        ApexDwolla_API_Test_Data.createApiConfigData(true);
        
        Test.StartTest();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ApexDwolla_API_Test_Mock.GetSessionSuccess()); 
        ApexDwolla_API_Wrapper.Session session = ApexDwolla_API_Callout_Handler.getSession();
        Test.StopTest();
        
        System.debug('session: ' + session);
        System.assert(session.res != null, 'Null session returned');
        HttpResponse res = session.res;
        
        System.assertEquals('application/json', res.getHeader('Content-Type'));
        System.assertEquals(ApexDwolla_API_Test_JSON.GET_SESSION_JSON, res.getBody());
        System.assertEquals(200, res.getStatusCode());
        
        System.assert(session.access_token.length() == 50, 'Invalid access_token returned: ' + session.access_token);
        try{
            Date d = session.expiration_time.date();
            Time t = session.expiration_time.time();
        }
        catch (Exception e) {
            System.assert(FALSE, 'session.expiration_time was an invalid DateTime: ' + session.expiration_time);
        }
        DateTime oldExpirationTime = session.expiration_time;
        
        session = ApexDwolla_API_Callout_Handler.getSession();
        System.assert(session.access_token.length() == 50, 'Invalid access_token returned: ' + session.access_token);
        System.assert(session.expires_in == NULL, 'API call was made when it the session was already saved');
        //expiration_time should not have changed because it was saved.
        System.assertEquals(oldExpirationTime, session.expiration_time);
    }
    
    @isTest static void testGetSessionException() {
        ApexDwolla_API_Test_Data.createApiConfigData(true);
        
        // By not wrapping the below 2 lines in Test.Start/StopTest(), I ensure an exception will be generated
        // for performing DML before an API call
        Test.setMock(HttpCalloutMock.class, new ApexDwolla_API_Test_Mock.GetSessionSuccess()); 
        ApexDwolla_API_Wrapper.Session session = ApexDwolla_API_Callout_Handler.getSession();
        System.assert(session == NULL,'session should have been NULL due to exception');
    }
    
    @isTest static void testGetSessionError() {
        ApexDwolla_API_Test_Data.createApiConfigData(true);
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new ApexDwolla_API_Test_Mock.CalloutError()); 
        ApexDwolla_API_Wrapper.Session session = ApexDwolla_API_Callout_Handler.getSession();
        Test.stopTest();
        
        System.assert(session == NULL, 'session should have been NULL due to error response');
    }
    
    @isTest static void testGetAccountDetailsSuccess() {
        ApexDwolla_API_Test_Data.createApiConfigData(false);
        ApexDwolla_API_Wrapper.Session session = new ApexDwolla_API_Wrapper.Session('access_token','token',DateTime.now().addHours(1));
        String accountId = 'accountId';
        
        
        Test.StartTest();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ApexDwolla_API_Test_Mock.GetAccountDetailsSuccess()); 
        ApexDwolla_API_Wrapper.Account accountDetails = ApexDwolla_API_Callout_Handler.getAccountDetails(session, accountId);
        Test.StopTest();
        
        System.debug('accountDetails: ' + accountDetails);
        System.assert(accountDetails.res != null, 'Null account details returned');
        HttpResponse res = accountDetails.res;
        
        System.assertEquals('application/json', res.getHeader('Content-Type'));
        System.assertEquals(ApexDwolla_API_Test_JSON.GET_ACCOUNT_DETAILS_JSON, res.getBody());
    }
    
    @isTest static void testGetAccountDetailsException() {
        ApexDwolla_API_Test_Data.createApiConfigData(false);
        ApexDwolla_API_Wrapper.Session session = new ApexDwolla_API_Wrapper.Session('access_token','token',DateTime.now().addHours(1));
        String accountId = 'accountId';
        
        // By not wrapping the below 2 lines in Test.Start/StopTest(), I ensure an exception will be generated
        // for performing DML before an API call
        Test.setMock(HttpCalloutMock.class, new ApexDwolla_API_Test_Mock.GetAccountDetailsSuccess()); 
        ApexDwolla_API_Wrapper.Account accountDetails = ApexDwolla_API_Callout_Handler.getAccountDetails(session, accountId);
        System.assert(accountDetails == NULL,'accountDetails should have been NULL due to exception');
    }
    
    @isTest static void testGetAccountDetailsError() {
        ApexDwolla_API_Test_Data.createApiConfigData(false);
        ApexDwolla_API_Wrapper.Session session = new ApexDwolla_API_Wrapper.Session('access_token','token',DateTime.now().addHours(1));
        String accountId = 'accountId';
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new ApexDwolla_API_Test_Mock.CalloutError()); 
        ApexDwolla_API_Wrapper.Account accountDetails = ApexDwolla_API_Callout_Handler.getAccountDetails(session, accountId);
        Test.stopTest();
        
        System.assert(accountDetails == NULL, 'accountDetails should have been NULL due to error response');
    }
}