//
//  AppDelegate.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootNavigationController = UINavigationController(rootViewController: ConversationsViewController())
        rootNavigationController.navigationBar.prefersLargeTitles = true
        
        window = UIWindow()
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
