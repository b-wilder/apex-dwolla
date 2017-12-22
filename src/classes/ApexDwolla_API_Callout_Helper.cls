public class ApexDwolla_API_Callout_Helper {
    public static HttpRequest buildHttpRequest(String endpoint, String method, map<String,String> headers, String body){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod(method);
        for(String headerKey : headers.keySet()){
            req.setHeader(headerKey, headers.get(headerKey));
        }
        req.setBody(body);
        return req;
    }
    
    public static HttpResponse makeCallout(Http h, HTTPRequest req){
        Dwolla_API_Log_Level__c logLevel = Dwolla_API_Log_Level__c.getOrgDefaults();
        try{
            HttpResponse res = h.send(req);
            handleResponseStatus(res);
            if(logLevel.Log_All__c){
                generateApiLog(res);
            }
            return res;
        }
        catch(Exception e){
            if(logLevel.Log_Errors__c || logLevel.Log_All__c){
                //Create Dwolla_API_Log__c record with exception information
                String errorMsg = e.getTypeName() + ': ' + e.getMessage();
                String exceptionStackTrace = e.getStackTraceString();
                generateApiLog(errorMsg, exceptionStackTrace);
            }
            return null;
        }
    }
    
    public static void handleResponseStatus(HttpResponse res){
        Dwolla_API_Log_Level__c logLevel = Dwolla_API_Log_Level__c.getOrgDefaults();
        if(logLevel.Log_Errors__c || logLevel.Log_All__c){
            Integer statusCode = res.getStatusCode();
            String statusCodeStr = String.valueOf(statusCode);
            if(statusCode == 200){
                return;
            }
            else{
                //Create Dwolla_API_Log__c record with callout error information
                String errorMsg = statusCodeStr + ' ';
                JSONParser parser = JSON.createParser(res.getBody());
                ApexDwolla_API_Wrapper.CalloutError calloutError;
                if (parser.nextToken() == JSONToken.START_OBJECT) {
                    calloutError = (ApexDwolla_API_Wrapper.CalloutError)parser.readValueAs(ApexDwolla_API_Wrapper.CalloutError.class);
                }
                errorMsg += calloutError.code + ': ' + calloutError.message;
                generateApiLog(res, errorMsg);
            }
        }
    }
    
    public static void generateApiLog(HttpResponse res){
        Dwolla_API_Log__c apiLog = buildApiLog(res);
        insertApiLog(apiLog);
    }
    
    public static void generateApiLog(HttpResponse res, String errorMsg){
        Dwolla_API_Log__c apiLog = buildApiLog(res);
        apiLog.IsError__c = TRUE;
        apiLog.Error_Message__c = errorMsg;
        insertApiLog(apiLog);
    }
    
    public static void generateApiLog(String errorMsg, String exceptionStackTrace){
        Dwolla_API_Log__c apiLog = new Dwolla_API_Log__c(
            IsError__c = TRUE,
            Error_Message__c = errorMsg,
            Exception_Stack_Trace_String__c = exceptionStackTrace
        );
        insertApiLog(apiLog);
    }
    
    public static Dwolla_API_Log__c buildApiLog(HttpResponse res){
        String statusCode = String.valueOf(res.getStatusCode());
        String status = res.getStatus();
        String headers = '';
        for (String resKey : res.getHeaderKeys()){
            headers += resKey + ': ' + res.getHeader(resKey) + '\n';
        }
        
        //The goal of the following 2 lines is get the response body in a "pretty" (readable) format
        Map<String, Object> deserializedResponse = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        String body = Json.serializePretty(deserializedResponse);
        
        return new Dwolla_API_Log__c(
            Status_Code__c = statusCode,
            Status__c = status,
            Headers__c = headers,
            Body__c = body
        );
    }
    
    public static void insertApiLog(Dwolla_API_Log__c apiLog){
        insert apiLog;
    }
}