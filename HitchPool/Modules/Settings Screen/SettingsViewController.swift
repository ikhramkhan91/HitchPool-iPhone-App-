//
//  SettingsViewController.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 07/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var profilePicture: UIImageView!
    
    var menuArray = ["Emergency SOS","Report an incident","Rate on App Store","Invite friends","Help","Terms & Conditions","Privacy Policy","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setCustomTitleView(title: "Settings")
        profilePicture.layer.cornerRadius = 37.5
        profilePicture.layer.borderWidth = 1.0
        profilePicture.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = menuArray[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerToPresent = storyboard?.instantiateViewController(withIdentifier: "MenuDetailViewController") as! MenuDetailViewController
        switch indexPath.row {
            case 0:
                viewControllerToPresent.navigationTitle = "Help Me"
                self.navigationController?.pushViewController(viewControllerToPresent, animated: true)
            case 1:
                viewControllerToPresent.navigationTitle = "Report an incident"
                self.navigationController?.pushViewController(viewControllerToPresent, animated: true)
            default:
                break
        }
    }
}
