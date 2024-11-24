package hxhtml.types;
class ResponseStatus {
    //TODO: Add all Error codes
    private static var statusCodes:Map<Int,String> = [
        200=>"200 OK",
        500=>"500 Internal Server Error",
        666=>"666 Deamon Incoming",
        669=>"669 Hyscript Incoming"
    ];
    public static function getStatus(status: Int, ?statusMessage:Null<String>):String {
        if (statusCodes[status] != null) {
            return statusCodes[status];
        } else {
            return status + " " + statusMessage ?? "Undefined";
        }
    }
}