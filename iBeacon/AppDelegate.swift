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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //UIApplicationBackgroundFetchIntervalMinimum - will be decided optimally by the OS
        application.setMinimumBackgroundFetchInterval(Constants.MINIMUM_BACKGROUND_FETCH_INTERVAL)
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        //completionHandler(.newData)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        print("HELLO background")
    }
}

