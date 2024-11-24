package;
import hxhtml.HtmlServer;
import hxhtml.types.Response;


class Test extends HtmlServer {
    static function main() {
        new Test("0.0.0.0",8080,(request)-> {
            var response = new Response();
            throw("Test");
            response.getBody().writeString("Test");
            response.setHeader("Content-Type","text/json");
            return response;
        });
    }
}