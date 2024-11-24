package src.types;

class Request {
    private var method:HttpMethod;
    private var headers:Array<Header>;
    private var body:Null<String>;

    public function new(method:HttpMethod,headers:Array<Header>,body:String) {
        this.method = method;
        this.headers = headers;
        this.body = body;
    }

    public function getMethod():HttpMethod {
        return method;
    }

    public function getHeaders():HttpMethod {
        return method;
    }


    public function getHeader(name:String):Null<Header> {
    
        var fh = headers.filter(header -> {
            return header.getKey() == name;
        });
        
        return fh.length > 0 ? fh[1] : null;
    }

}