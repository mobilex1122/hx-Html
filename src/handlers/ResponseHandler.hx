package src.handlers;

import sys.net.Socket;
import src.types.*;

class ResponseHandler {
  
    public static function handle(client:Socket,response:Response) {
        client.write(response.buildResponce());
        client.close();
    }
}