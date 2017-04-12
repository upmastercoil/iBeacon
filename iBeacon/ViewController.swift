import UIKit
import Alamofire
//import Apr
//import ABBluetoothManager

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var beacons: [UpBeacon]!

    @IBOutlet weak var collectionViewBeacons: UICollectionView!
    
    override func viewDidLoad() {
        
        func initUpBeacons() {
            
            beacons = []
            for i in 0..<50 {
                beacons.append(UpBeacon(id: String(i)))
            }
        }
        
        super.viewDidLoad()
        initUpBeacons()
        collectionViewBeacons.delegate = self
        collectionViewBeacons.dataSource = self
    }
    func numberOfSections(in collectionViewBeacons: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return beacons.count
    }
    
    func collectionView(_ collectionViewBeacons: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewBeacons.dequeueReusableCell(withReuseIdentifier: "beaconCell", for: indexPath) as! UpBeaconCell
        let beacon = beacons[indexPath.item]
        cell.textViewBeacon.text = beacon.uuid
        return cell
    }
}

