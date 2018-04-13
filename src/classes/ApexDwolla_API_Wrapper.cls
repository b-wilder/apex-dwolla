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
    }
    
    public class Session extends CalloutResponse{
        public String access_token;
        public String token_type;
        public Integer expires_in;
        public DateTime expiration_time;
        
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
		Public Decimal timezoneOffset;
		Public String type;
	}
}