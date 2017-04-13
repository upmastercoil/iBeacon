//
//  AppDelegate.swift
//  iBeacon
//
//  Created by Alex Burzak on 20/03/2017.
//  Copyright © 2017 UpMaster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //var beaconManager:ABBluetoothManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //UIApplicationBackgroundFetchIntervalMinimum - will be decided optimally by the OS
        application.setMinimumBackgroundFetchInterval(Constants.MINIMUM_BACKGROUND_FETCH_INTERVAL)
        
        //self.beaconManager = ABBluetoothManager()
        //self.beaconManager?.delegate = self as! ABBluetoothManagerDelegate
        //self.beaconManager?.addCustomBeaconNameFilter(Constants.IBEACON_NAME_FILTER)
        //self.beaconManager?.startAprilBeaconsDiscovery()
        
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
/*
         //You can write whatever you like here (please just do networking...). before returning you must call the completion handler with the right enum that sums up the operation
         let url = URL(string: "http://swapi.co/api/people/1")!
         let dataTask = URLSession().dataTask(with: url) {
         data, reponse, error in
         guard let data = data else {
         completionHandler(.failed)
         print("NO DATA")
         return
         }
         guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any] else {
         completionHandler(.failed)
         print("JSON ERROR")
         return
         }
         let name = json["name"] as! String
         let userDefaults = UserDefaults.standard
         if let oldName = userDefaults.value(forKey: "NAME") as? String, name == oldName {
         completionHandler(.noData)
         print("old name with \(oldName)")
         return
         }
         userDefaults.setValue(name, forKey: "NAME")
         print("new name with \(name)")
         completionHandler(.newData)
         }
         dataTask.resume()
         */
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        print("HELLO background")
    }
}

