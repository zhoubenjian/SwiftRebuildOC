//
//  AppDelegate.swift
//  SwiftRebuildOC
//
//  Created by Benjamin on 2020/5/13.
//  Copyright © 2020 com.Personal.Benjamin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var nav: UINavigationController?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.nav = UINavigationController()
        self.nav?.viewControllers = [HomeVC()]
        
        /*** 修复Swift5.5后，iOS 13导航栏黑色背景 ***/
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = colorWithHex(hexColorStr: "#EE82EE")
            self.nav?.navigationBar.standardAppearance = appearance
            self.nav?.navigationBar.scrollEdgeAppearance = appearance
        }
        /*** 修复Swift5.5后，iOS 13导航栏黑色背景 ***/
            
        self.nav?.navigationBar.isTranslucent = false
        self.nav?.navigationBar.shadowImage = UIImage()
        self.nav?.navigationBar.barTintColor = colorWithHex(hexColorStr: "#EE82EE")     //  #FFC0CB #FE4D4D
        let dic: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
        self.nav?.navigationBar.titleTextAttributes = dic as? [NSAttributedString.Key: AnyObject]
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

