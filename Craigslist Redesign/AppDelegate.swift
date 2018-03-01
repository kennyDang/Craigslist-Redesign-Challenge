//
//  AppDelegate.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().tintColor = UIColor.customDarkGreen
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.customDarkGreen]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.customDarkGreen]

        let rootViewController = CustomTabBarViewController()

        let appCoordinator = AppCoordinator(window: window!, rootViewController: rootViewController)
        appCoordinator.start()

        return true
    }

}

