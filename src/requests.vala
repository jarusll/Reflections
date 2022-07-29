using Soup;

namespace Requests {
    class Call: GLib.Object {
        private Message message;
        private Session session;

        public Call(){
            this.session = new Session();
        }

        public Call get(string uri){
            this.message = new Message("GET", uri);
            return this;
        }

        public Call post(string uri, uint8[] payload){
                this.message = new Message ("POST", uri);
                var contentType = "Content-Type: application/json:";
                var postIt = "{\"jsonrpc\":\"2.0\", \"method\":\"condenser_api.get_accounts\", \"params\":[[\"oaldamster\"]], \"id\":1}";

                this.message.set_request(contentType, MemoryUse.COPY, postIt.data);
                return this;
        }

        public Message make(){
            this.session.send_message(message);
            return message;
        }
    }
}
