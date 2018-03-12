//
//  LocationScreenViewController.swift
//  HitchPool
//
//  Created by Pravina Venugopal on 06/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class LocationScreenViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var locationTable: UITableView!
    var locationSearchTitle:String?
    let locationListArray = ["Bengaluru","Chandigarh","Chennai","Hyderabad","Indore","Chennai","Jaipur","Kanpur","Kolkata","Lucknow","Mumbai","Nagpur","New Delhi","Pune","Odissa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUiViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureUiViews() {
        searchBar.placeholder = locationSearchTitle ?? String()
    }

}
extension LocationScreenViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Popular Cities"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationListArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = locationListArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if locationSearchTitle == "From" {
            fromCity = locationListArray[indexPath.row]
        } else {
            toCity = locationListArray[indexPath.row]
        }
        self.dismiss(animated: true, completion: nil)
    }
}
