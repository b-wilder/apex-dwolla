@isTest
global class ApexDwolla_API_Test_Mock {
    global class CalloutError implements HttpCalloutMock{
        global HTTPResponse respond(HTTPRequest request) {
            // Create a fake response
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody(ApexDwolla_API_Test_JSON.CALLOUT_ERROR_JSON);
            response.setStatusCode(401);
            return response; 
        }
    }
    global class GetSessionSuccess implements HttpCalloutMock{
        global HTTPResponse respond(HTTPRequest request) {
            // Create a fake response
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody(ApexDwolla_API_Test_JSON.GET_SESSION_JSON);
            response.setStatusCode(200);
            return response; 
        }
    }
    
    global class GetAccountDetailsSuccess implements HttpCalloutMock{
        global HTTPResponse respond(HTTPRequest request) {
            // Create a fake response
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody(ApexDwolla_API_Test_JSON.GET_ACCOUNT_DETAILS_JSON);
            response.setStatusCode(200);
            return response; 
        }
    }
}