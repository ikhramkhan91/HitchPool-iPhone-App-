//
//  HPAppDelegate.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 07/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit
public class HPAppDelegate: NSObject, UIApplicationDelegate {
    public static let shared = HPAppDelegate()
    public override init() {}
    public func applicationDidFinishLaunching(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        configureAppNavigationBar()
    }
    func configureAppNavigationBar() {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        UIDevice.current.isBatteryMonitoringEnabled = true
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black,NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
        UIBarButtonItem.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().barTintColor = UIColor.appThemeColour()
        UINavigationBar.appearance().backgroundColor = UIColor.white
       UITabBar.appearance().unselectedItemTintColor = UIColor.black
    }
}
