public class ApexDwolla_API_Test_JSON {
   	public static final String CALLOUT_ERROR_JSON =
        '{\n' +
        '  "code": "InvalidAccessToken",\n' +
        '  "message": "Invalid access token."\n' +
        '}';
    
    public static final String GET_SESSION_JSON =
        '{\n' +
        '    "access_token": "Te0F6QOXvew1JIVgiko8z17vvb1dxohepmLq76ZnHo2WDnu0Wj",\n' +
        '    "token_type": "bearer",\n' +
        '    "expires_in": 3608\n' +
        '}';
	public static final String GET_ACCOUNT_DETAILS_JSON =
        '{\n' +
        '    "_links": {\n' +
        '        "self": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/accounts/FrljeVOY-dGCP-k3f3-shq8-T5PcWXDRE2QI",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "account"\n' +
        '        },\n' +
        '        "receive": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/transfers",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "transfer"\n' +
        '        },\n' +
        '        "funding-sources": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/accounts/FrljeVOY-dGCP-k3f3-shq8-T5PcWXDRE2QI/funding-sources",\n' +
        '            "type": "application/vnd.dwolla.v1.hal+json",\n' +
        '            "resource-type": "funding-source"\n' +
        '        },\n' +
        '        "transfers": {\n' +
        '            "href": "https://api-sandbox.dwolla.com/accounts/FrljeVOY-dGCP-k3f3-shq8-T5PcWXDRE2QI/transfers",\n' +
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
        '    "id": "FrljeVOY-dGCP-k3f3-shq8-T5PcWXDRE2QI",\n' +
        '    "name": "System Synthesis",\n' +
        '    "timezoneOffset": -6,\n' +
        '    "type": "Commercial"\n' +
        '}';
}