
struct UpBeacon {

    var uuid:String;
    var major:String;
    var minor:String;
    
    var link:String;
    var title:String;
    var description:String;
    var color:String;
    var showedTime:CLong;
    var distance:Double;
    
    init(){
        
        uuid = ""
        major = ""
        minor = ""
        link = ""
        title = ""
        description = ""
        color = ""
        showedTime = 0
        distance = 0
    }
    
    init(id uuid:String) {
        self.uuid = uuid
        major = ""
        minor = ""
        link = ""
        title = ""
        description = ""
        color = ""
        showedTime = 0
        distance = 0
    }
}
