//
//  LaunchScreenViewController.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 06/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        let tabControlllerToPresent = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        //tabControlllerToPresent.tabBar.barTintColor = UIColor.red
        tabControlllerToPresent.tabBar.isTranslucent = true
        self.navigationController?.present(tabControlllerToPresent, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
