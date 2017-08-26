//
//  AppDelegate.swift
//  Giphsy
//
//  Created by Ajay Mann on 8/26/17.
//  Copyright © 2017 Ajay Mann. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let searchController = SearchController()
    let rootVC = UINavigationController(rootViewController: searchController)
    rootVC.isNavigationBarHidden = true
    window?.rootViewController = rootVC
    return true
  }

}

