//
//  AppDelegate.swift
//  youtube
//
//  Created by Bijan Oviedo on 9/6/16.
//  Copyright © 2016 Bijan Oviedo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let layout = UICollectionViewFlowLayout()
        let rootVC = HomeVC(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: rootVC)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navController
        
        application.statusBarStyle = .lightContent
        
        customizeNavBarAppearance()
        setupStatusBarBackgroundView()
        
        return true
    }
    
    func customizeNavBarAppearance() {
        UINavigationBar.appearance().barTintColor = Constants.navBarColor
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    func setupStatusBarBackgroundView() {
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = Constants.statusBarColor
        statusBarBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        window?.addSubview(statusBarBackgroundView)
        
        statusBarBackgroundView.leadingAnchor.constraint(equalTo: (window?.leadingAnchor)!).isActive = true
        statusBarBackgroundView.trailingAnchor.constraint(equalTo: (window?.trailingAnchor)!).isActive = true
        statusBarBackgroundView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        statusBarBackgroundView.topAnchor.constraint(equalTo: (window?.topAnchor)!).isActive = true
    }

}

