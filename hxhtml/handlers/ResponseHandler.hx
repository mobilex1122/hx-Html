package hxhtml.handlers;

import sys.net.Socket;
import hxhtml.types.*;

class ResponseHandler {
  
    public static function handle(client:Socket,response:Response) {
        client.write(response.buildResponce());
        client.close();
    }
}