//
//  MainTabBar.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 06/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(viewController.restorationIdentifier)
    }
}
