public class ApexDwolla_API_Callout {
    public static String makeCallout(Http h, HTTPRequest req){
        HttpResponse res = h.send(req);
        String jsonResponse = res.getBody();
        return jsonResponse;
    }
}