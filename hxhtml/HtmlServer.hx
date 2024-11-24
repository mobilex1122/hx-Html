package ;

import sys.net.Host;
import sys.net.Socket;

import hxhtml.handlers.ClientHandler;
import hxhtml.types.*;

abstract class HtmlServer {
    public function new(host:String,port:Int,handler: Request->Response) {
        #if (!target.threaded)
            throw("Unsupported target! Requires 'sys.thread' support");
        #end
        var socket = new Socket();

        var hostObj = new Host(host);
        socket.bind(hostObj,port);

        socket.listen(100);

        while (true) {
            var client = socket.accept();
            trace("Connected!");
            #if (target.threaded)
                sys.thread.Thread.create(() -> {
                    trace("Created Thread");
                    try {
                        var clientHandler = new ClientHandler(client);
                        clientHandler.handle(handler);
                    } catch (e) {
                        trace("Thread crashed! Closing connection.");
                        var response = new Response();
                        response.setStatus(666);
                        response.getBody().writeString("Error: " + e.message);
                        client.write(response.buildResponce());
                        client.close();
                    }
                });
            #end
        }
    }
}