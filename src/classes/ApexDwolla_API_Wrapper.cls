public class ApexDwolla_API_Wrapper {
    public virtual class CalloutResponse{
        public HttpResponse res;
        public void setHttpResponse(HttpResponse r){
            this.res = r;
        }
    }
    public class CalloutError extends CalloutResponse{
        public string code;
        public string message;
        
        public calloutError(String c, String m){
            this.code = c;
            this.message = m;
        }
    }
    
    public class Session extends CalloutResponse{
        public String access_token;
        public String token_type;
        public Integer expires_in;
        public DateTime expiration_time;
        
        public Session(String at, String tt, Integer ei){
            this.access_token = at;
            this.token_type = tt;
            this.expires_in = ei;
        }
        
        public Session(String at, String tt, DateTime et){
            this.access_token = at;
            this.token_type = tt;
            this.expiration_time = et;
        }
        
        public void setExpirationTime(){
            this.expiration_time = DateTime.now().addSeconds(this.expires_in).addSeconds(-30);
        }
    }
    
    public class Account extends CalloutResponse{
		Public String id;
		Public String name;
		Public Integer timezoneOffset;
		Public String type;
        
        public Account(String i, String n, Integer to, String t){
            this.id = i;
            this.name = n;
            this.timezoneOffset = to;
            this.type = t;
        }
	}
}