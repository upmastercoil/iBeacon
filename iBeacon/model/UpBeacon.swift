
struct UpBeacon {

    var uuid:UUID
    var major:NSNumber
    var minor:NSNumber
    
    var link:String
    var title:String
    var description:String
    var color:UIColor
    var showedTime:TimeInterval
    var distance:NSNumber
    
    init() {
        uuid = UUID()
        major = 0
        minor = 0
        link = ""
        title = ""
        description = ""
        color = UIColor()
        showedTime = TimeInterval.init()
        distance = 0
    }
    
    init(id uuid:UUID,
         number major:NSNumber,
         number minor:NSNumber,
         url link:String,
         page title:String,
         help description:String,
         beacon color:UIColor,
         current showedTime:TimeInterval,
         meters distance:NSNumber) {
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.link = link
        self.title = title
        self.description = description
        self.color = color
        self.showedTime = showedTime
        self.distance = distance
    }
}
