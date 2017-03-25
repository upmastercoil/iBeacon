import Alamofire

class IRequestUpBeacon {
    
    init() {

        Alamofire.request(Constants.GET_BEACON_URL).responseJSON { response in
            guard let json = response.result.value as? [String: Any] else { return }
            print(json)
            
        }
        
    }

}
