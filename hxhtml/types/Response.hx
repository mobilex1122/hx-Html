package hxhtml.types;

import haxe.io.BytesOutput;

class Response {
    private var headers:Array<Header>;
    private var status:String;
    private var body:BytesOutput;

    public function new() {
        status = ResponseStatus.getStatus(200);
        body = new BytesOutput();
        headers = [];
        setHeader("Content-Type","text/html");
        setHeader("Server","Haxe Html Server");
    }

    public function setHeader(key:String,value:String) {
        if (headers.length > 0) {
            var fh = headers.filter(header -> {
                return header.getKey() == key.toLowerCase();
            });
            if (fh.length > 0) {
                var index = headers.indexOf(fh[0]);
                if (index >= 0) {
                    headers[index] = new Header(key,value);
                    return;
                }
            }
        }
        headers.push(new Header(key,value));
        
    }

    public function getBody() {
        return body;
    }

    public function setStatus(statusCode:Int,?statusMessage: Null<String>) {
        status = ResponseStatus.getStatus(statusCode,statusMessage);
    }



    public function buildResponce() {
        var res = "HTTP/1.1 " + status +"\r\n";

        setHeader("Content-Lenght", Std.string(body.length));
        for (header in headers) {
            res += header.getHeader() + "\r\n";
        }
        res += "\r\n";

        res += body.getBytes().toString( );

        return res;
    }

}