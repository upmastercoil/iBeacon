import Alamofire
import UIKit

struct IRequestUpBeacon {
    
    func getUpBeacon(april beacon:ABBeacon) -> UpBeacon{
        
        var upBeacon = UpBeacon()
        let uuid = beacon.peripheral.identifier
        let major = beacon.major
        let minor = beacon.minor
        
        //let url = "\(Constants.GET_BEACON_URL)?\(Constants.UUID)=\(uuid.uuidString)&\(Constants.MAJOR)=\((major?.stringValue)!)&\(Constants.MINOR)=\((minor?.stringValue)!)"
        //url.append("\(Constants.UUID)=" + uuid.uuidString + "&")
        //url.append("\(Constants.MAJOR)=" + (major?.stringValue)! + "&")
        //url.append("\(Constants.MINOR)=" + (minor?.stringValue)!)
        
        //let url = URL(string: Constants.GET_BEACON_URL)!

        
        
        Alamofire.request(Constants.GET_BEACON_URL).responseJSON { response in
            guard let json = response.result.value as? [String: Any] else { return }
            
            let link = json["url"] as! String
            let title = json["title"] as! String
            let description = json["help"] as! String
            let colorJson = json["color"] as! String
            let color = UIColor(hexString: colorJson)
            let showedTime:TimeInterval = NSDate().timeIntervalSince1970
            let distance:NSNumber = beacon.distance
          
            upBeacon = UpBeacon(id: uuid, number: major!, number: minor!, url: link, page: title, help: description, beacon: color!, current: showedTime, meters: distance)
        }

        return upBeacon
    }
}
