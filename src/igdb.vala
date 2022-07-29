using Soup;
using Json;

namespace IGDB {
    class Client : GLib.Object {
        private static string baseUrl = "https://api.igdb.com/v4/";
        private static Session session;
        public Client(){
            session = new Session();
        }

        public string search(string type, string query){
            try {
                var messageHeaders = new MessageHeaders(MessageHeadersType.MULTIPART);
                messageHeaders.append("Content-Type", "text/plain");
                messageHeaders.append("Client-ID", "");
                messageHeaders.append("Authorization", "");
                var payloadData = new Bytes(query.data);
                var formData = new Multipart("application/json");
                formData.append_part(messageHeaders, payloadData);
                var message = new Message.from_multipart(
                    baseUrl.concat(type),
                    formData);
                message = new Message.from_encoded_form(
                    "POST",
                    "https://id.twitch.tv/oauth2/token",
	                ""
                    );
                var rawResponse = (string)session.send_and_read(message).get_data();
                var parser = new Parser();
                parser.load_from_data(rawResponse);
                return rawResponse;
            } catch (Error e){
                return e.message;
            }
        }
    }
}
