import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ABBluetoothManagerDelegate, ABBeaconManagerDelegate {
    
    var bluetoothBeacons = [ABBeacon]()
    var aprilBeacons = [ABBeacon]()
    var bluetoothManager:ABBluetoothManager?
    var beaconManager:ABBeaconManager?
    var beaconRegion:ABBeaconRegion?
    
    @IBOutlet weak var collectionViewBeacons: UICollectionView!
    
    override func viewDidLoad() {
        
        func initBeacons() {
            
            self.beaconManager = ABBeaconManager()
            self.beaconManager?.delegate = self as ABBeaconManagerDelegate
        }
        
        func initBluetooth(){
            
            self.bluetoothManager = ABBluetoothManager()
            self.bluetoothManager?.delegate = self as ABBluetoothManagerDelegate
            self.bluetoothManager?.startAprilBeaconsDiscovery()
        }
        
        super.viewDidLoad()
        
        initBluetooth()
        initBeacons()

        collectionViewBeacons.delegate = self
        collectionViewBeacons.dataSource = self
    }
    
    func beaconManager(_ manager: ABBeaconManager!, didRangeBeacons beacons: [Any]!, in region: ABBeaconRegion!) {
        
        //aprilBeacons.removeAll()
        print("")
        print("---=================---")
        
        for beacon in beacons{
            //aprilBeacons.append(beacon as! ABBeacon)
        }
        
        collectionViewBeacons.reloadData()
        //TODO Noy
    }
    
    func beaconManager(_ manager: ABBluetoothManager!, didDiscover beacon: ABBeacon!) {
        
        if bluetoothBeacons.contains(beacon) != true{
            bluetoothBeacons.append(beacon)
        }
        
        collectionViewBeacons.reloadData()
        
    }
    
    func numberOfSections(in collectionViewBeacons: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bluetoothBeacons.count
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let beacon:ABBeacon = bluetoothBeacons[indexPath.item]
        
        let peripheral:CBPeripheral = beacon.peripheral
        let cell = collectionViewBeacons.dequeueReusableCell(withReuseIdentifier: "beaconCell", for: indexPath) as! UpBeaconCell
        let uuid = peripheral.identifier.uuidString
        cell.textViewBeacon.text = peripheral.name! + " - UUID = " + uuid
        
        beaconRegion = ABBeaconRegion(proximityUUID: peripheral.identifier, identifier: Constants.IBEACON_REGION)
        self.beaconManager?.startRangingBeacons(in: beaconRegion)
        
        return cell
    }
    
    
}














