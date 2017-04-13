import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ABBluetoothManagerDelegate {
    
    var beaconsApril = [ABBeacon]()
    var beaconManager:ABBluetoothManager?

    @IBOutlet weak var collectionViewBeacons: UICollectionView!
    
    override func viewDidLoad() {
        
        func initUpBeacons() {
            
            self.beaconManager = ABBluetoothManager()
            self.beaconManager?.delegate = self as ABBluetoothManagerDelegate
            self.beaconManager?.startAprilBeaconsDiscovery()
            self.beaconManager?.addCustomBeaconNameFilter(Constants.IBEACON_NAME_FILTER)
        }
        
        super.viewDidLoad()
        initUpBeacons()
        collectionViewBeacons.delegate = self
        collectionViewBeacons.dataSource = self
    }
    
//    func beaconManager(_ manager: ABBluetoothManager!, didDiscover beacon: ABBeacon!) {
//        
//        beaconsApril.append(beacon!)
//        collectionViewBeacons.reloadData()
//    }
    
    func beaconManager(_ manager: ABBluetoothManager!, didDiscoverBeacons beacons: [Any]!) {

        beaconsApril.removeAll()
        for beacon in beacons{
            beaconsApril.append(beacon as! ABBeacon)
        }

        collectionViewBeacons.reloadData()
    }
    
    func numberOfSections(in collectionViewBeacons: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return beaconsApril.count
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let beacon:ABBeacon = beaconsApril[indexPath.item]
        let peripheral:CBPeripheral = beacon.peripheral
        let cell = collectionViewBeacons.dequeueReusableCell(withReuseIdentifier: "beaconCell", for: indexPath) as! UpBeaconCell
        let uuid = peripheral.identifier.uuidString
        cell.textViewBeacon.text = peripheral.name! + " - UUID = " + uuid
        
        return cell
    }
}

