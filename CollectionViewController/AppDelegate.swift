//
//  AppDelegate.swift
//  CollectionViewController
//
//  Created by Santhanalakshmi S on 29/01/20.
//  Copyright © 2020 Santhanalakshmi S. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let layout = UICollectionViewFlowLayout()
        let vc = CollectionViewController(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle



}

