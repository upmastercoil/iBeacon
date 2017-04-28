//
//  AppDelegate.swift
//  iBeacon
//
//  Created by Alex Burzak on 20/03/2017.
//  Copyright © 2017 UpMaster. All rights reserved.
//
import Alamofire
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ABBluetoothManagerDelegate {

    var window: UIWindow?
    var aprilBeacons = [ABBeacon]()
    var upBeacons = [UpBeacon]()
    var beaconManager:ABBluetoothManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        func initAprilBeacons() {
            
            self.beaconManager = ABBluetoothManager()
            self.beaconManager?.delegate = self as ABBluetoothManagerDelegate
            self.beaconManager?.startAprilBeaconsDiscovery()
            //TODO self.beaconManager.INTERVAL???
            self.beaconManager?.addCustomBeaconNameFilter(Constants.IBEACON_NAME_FILTER)
        }
        
        //UIApplicationBackgroundFetchIntervalMinimum - will be decided optimally by the OS
        application.setMinimumBackgroundFetchInterval(Constants.MINIMUM_BACKGROUND_FETCH_INTERVAL)
        
        //initAprilBeacons()
        
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        if aprilBeacons.count <= 0 {
            completionHandler(.noData)
            return
        }
        
        for beacon in aprilBeacons{
            let uuid = beacon.peripheral.identifier
            let major = beacon.major
            let minor = beacon.minor
            
            var urlString: String = Constants.GET_BEACON_URL
            urlString = urlString.appending("?\(Constants.UUID)=\(uuid.uuidString)")
            urlString = urlString.appending("&\(Constants.MAJOR)=\(major?.stringValue ?? "")")
            urlString = urlString.appending("&\(Constants.MINOR)=\(minor?.stringValue ?? "")")
            
            let url = URL(string: urlString)
            
            print("start url = \(url?.absoluteString)")
            
            
            let url2 = URL(string: "http://swapi.co/api/people/1")!
//            let dataTask = URLSession().dataTask(with: url) {
//                data, reponse, error in
//                guard let data = data else {
//                    completionHandler(.failed)
//                    print("NO DATA")
//                    return
//                }
//                guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any] else {
//                    completionHandler(.failed)
//                    print("JSON ERROR")
//                    return
//                }
//                let name = json["name"] as! String
//                let userDefaults = UserDefaults.standard
//                if let oldName = userDefaults.value(forKey: "NAME") as? String, name == oldName {
//                    completionHandler(.noData)
//                    print("old name with \(oldName)")
//                    return
//                }
//                userDefaults.setValue(name, forKey: "NAME")
//                print("new name with \(name)")
//                completionHandler(.newData)
//            }
//            dataTask.resume()

            completionHandler(.newData)
            
            //upBeacons.append(upBeacon)
        }        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        print("HELLO background")
    }
    
    //TODO stopAprilBeaconsDiscovery
    
    func beaconManager(_ manager: ABBluetoothManager!, didDiscover beacon: ABBeacon!) {
        
        if aprilBeacons.contains(beacon) != true{
            aprilBeacons.append(beacon)
        }
        //TODO update to distance????
        
    }
}

