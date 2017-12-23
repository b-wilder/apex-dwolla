public class ApexDwolla_API_Parser {
  public static String jsonVal =
        '{\n' +
        '    "_links": {\n' +
        '        "self": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/accounts/10c7e1aa-f554-40d0-b270-998380d72d12",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "account"\n' +
        '        },\n' +
        '        "receive": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/transfers",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "transfer"\n' +
        '        },\n' +
        '        "funding-sources": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/accounts/10c7e1aa-f554-40d0-b270-998380d72d12/funding-sources",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "funding-source"\n' +
        '        },\n' +
        '        "transfers": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/accounts/10c7e1aa-f554-40d0-b270-998380d72d12/transfers",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "transfer"\n' +
        '        },\n' +
        '        "customers": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/customers",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "customer"\n' +
        '        },\n' +
        '        "send": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/transfers",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "transfer"\n' +
        '        }\n' +
        '    },\n' +
        '    "id": "10c7e1aa-f554-40d0-b270-998380d72d12",\n' +
        '    "name": "System Synthesis",\n' +
        '    "timezoneOffset": -6,\n' +
        '    "type": "Commercial"\n' +
        '}';

    public static ApexDwolla_API_Wrapper.Session parseGetSession(String jsonResponse){
        JSONParser parser = JSON.createParser(jsonResponse);
        ApexDwolla_API_Wrapper.Session session;
        if (parser.nextToken() == JSONToken.START_OBJECT) {
             session = (ApexDwolla_API_Wrapper.Session)parser.readValueAs(ApexDwolla_API_Wrapper.Session.class);
        }
        return session;
    }

    /*public static ApexDwolla_API_Wrapper.Account parseGetAccountDetails(String jsonResponse){
        JSONParser parser = JSON.createParser(jsonResponse);
        ApexDwolla_API_Wrapper.Account acct;
        if (parser.nextToken() == JSONToken.START_OBJECT) {
             acct = (ApexDwolla_API_Wrapper.Account)parser.readValueAs(ApexDwolla_API_Wrapper.Account.class);
        }
        return acct;
    }*/
}