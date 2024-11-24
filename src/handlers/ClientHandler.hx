package src.handlers;

import src.handlers.ResponseHandler;
import src.handlers.RequestHandler;
import src.types.*;
import sys.net.Socket;

class ClientHandler {
    private var client:Socket;

    public function new(client:Socket) {
        this.client = client;
    }

    public function handle(handler:(Request:Request)->Response) {
        var request = RequestHandler.handle(client);
        var response = handler(request);
        trace("Response: \n"+response.buildResponce());
        ResponseHandler.handle(client,response);
    }
}