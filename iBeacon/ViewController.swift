import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ABBeaconManagerDelegate {
    
    var aprilBeacons = [ABBeacon]()
    var beaconManager:ABBeaconManager?
    var beaconRegion:ABBeaconRegion?
    
    @IBOutlet weak var collectionViewBeacons: UICollectionView!
    
    override func viewDidLoad() {
        
        func initUpBeacons() {
            
            self.beaconManager = ABBeaconManager()
            self.beaconManager?.delegate = self as ABBeaconManagerDelegate
            let beaconUUID = UUID()
            beaconRegion = ABBeaconRegion(proximityUUID: beaconUUID, identifier: Constants.IBEACON_REGION)
            self.beaconManager?.startRangingBeacons(in: beaconRegion)
        }
        
        super.viewDidLoad()
        initUpBeacons()
        collectionViewBeacons.delegate = self
        collectionViewBeacons.dataSource = self
    }
    
    func beaconManager(_ manager: ABBeaconManager!, didRangeBeacons beacons: [Any]!, in region: ABBeaconRegion!) {
        
        aprilBeacons.removeAll()
        for beacon in beacons{
            aprilBeacons.append(beacon as! ABBeacon)
        }
        
        collectionViewBeacons.reloadData()
        //TODO Noy
    }
    
    func numberOfSections(in collectionViewBeacons: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return aprilBeacons.count
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let beacon:ABBeacon = aprilBeacons[indexPath.item]
        
        let peripheral:CBPeripheral = beacon.peripheral
        let cell = collectionViewBeacons.dequeueReusableCell(withReuseIdentifier: "beaconCell", for: indexPath) as! UpBeaconCell
        let uuid = peripheral.identifier.uuidString
        cell.textViewBeacon.text = peripheral.name! + " - UUID = " + uuid
        return cell
    }
    
    
}














