package hxhtml.types;

class Header {
    private var key:String;
    private var value:String;
    public function new(key:String,value:String) {
        this.key = key.toLowerCase();
        this.value = value;
    }

    public function getKey() {
        return key;
    }

    public function getValue() {
        return value;
    }
    public function getHeader() {
        return key + ": " + value;
    }
}