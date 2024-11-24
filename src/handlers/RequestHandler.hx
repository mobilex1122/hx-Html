package src.handlers;

import src.types.Header;
import sys.net.Socket;
import src.types.*;

class RequestHandler {
    public static function handle(client:Socket) {
        var protocol = client.input.readLine();
        var lines:Array<String> = [];
        var receving = true;



        var readingHeader = true;
        // Read until we reach the end of the headers
        while (readingHeader) {
            var line = client.input.readLine();
            if (line != null && line != "") {
                lines.push(line);
            } else {
                readingHeader = false;
            }
        }
        trace("Received request headers: \n");
        for (line in lines) {
            trace(line);
        }
        trace("\n------\n");
        var contentLength = 0;
        var headers:Array<Header> = [];
        for (header in lines) {
            if (header != "") {
                if (StringTools.startsWith(header,"Content-Length:")) {
                    contentLength = Std.parseInt(StringTools.trim(header.split(":")[1]));
                }
                var spl = header.split(":");
                headers.push(new Header(spl[0],spl[1]));
            }
        }

        var body = null;
        if (contentLength > 0) {
            // Alocates bytes for the body
            var bytebody = haxe.io.Bytes.alloc(contentLength);
            
            // Writes all bytes from request to alocated bytes
            client.input.readBytes(bytebody,0,contentLength);

            body = bytebody.toString();
            trace("Received request body: " + body);
        }

        return new Request(HttpMethod.POST,headers,body);
    }
}