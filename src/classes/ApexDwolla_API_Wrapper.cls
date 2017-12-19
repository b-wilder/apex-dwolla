public class ApexDwolla_API_Wrapper {
    public class Session {
        public String access_token;
        public String token_type;
        public Integer expires_in;
        public DateTime expiration_time;
        
        public Session(String at, String tt, Integer ei){
            this.access_token = at;
            this.token_type = tt;
            this.expires_in = ei;
            
        }
        
        public void setExpirationTime(){
            this.expiration_time = DateTime.now().addSeconds(this.expires_in).addSeconds(-30);
        }
    }
    
    public class Account {
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