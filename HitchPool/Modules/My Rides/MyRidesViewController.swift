//
//  MyRidesViewController.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 07/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit
let rupeeSymbol = "\u{20B9}"
class MyRidesViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var upcomingRidesTable:UITableView!
    @IBOutlet weak var completedRidesTable:UITableView!
    @IBOutlet weak var upcomingRidesView:UIView!
    @IBOutlet weak var completedRidesView:UIView!
    
    var upcomingRidesArray = [RidesModel(travelTime: "Thu 15 March - 08.45", toAndFroLocation: "Bengaluru -> Chennai"),RidesModel(travelTime: "Fri 5 April - 18.30", toAndFroLocation: "Chandigarh -> Delhi"),RidesModel(travelTime: "Wed 8 April - 04.50", toAndFroLocation: "Chennai -> Indore"),RidesModel(travelTime: "Mon 15 May - 21.15", toAndFroLocation: "Mangalore -> Chennai"),RidesModel(travelTime: "Tue 15 June - 20.00", toAndFroLocation: "Mumbai -> Pune")]
    var upcominSeatsAndPrice = [RidesModel(travelTime: "4 seat(s)", toAndFroLocation: "\(rupeeSymbol) 75/Person"),RidesModel(travelTime: "2 seat(s)", toAndFroLocation: "\(rupeeSymbol) 105/Person"),RidesModel(travelTime: "1 seat(s)", toAndFroLocation: "\(rupeeSymbol) 250/Person"),RidesModel(travelTime: "3 seat(s)", toAndFroLocation: "\(rupeeSymbol) 475/Person"),RidesModel(travelTime: "2 seat(s)", toAndFroLocation: "\(rupeeSymbol) 175/Person")]
    var completedRidesArray = [RidesModel(travelTime: "Thu 15 Dec - 18.45", toAndFroLocation: "Bengaluru -> Chennai"),RidesModel(travelTime: "Fri 5 Jan - 18.30", toAndFroLocation: "Chandigarh -> Delhi"),RidesModel(travelTime: "Wed 8 Feb - 04.50", toAndFroLocation: "Chennai -> Indore"),RidesModel(travelTime: "Mon 15 Feb - 01.15", toAndFroLocation: "Mangalore -> Chennai")]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUiTableView()
        completedRidesView.isHidden = true
        self.navigationItem.setCustomTitleView(title: "My Rides")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedControlSelected(_ sender: UISegmentedControl) {
        print("acewfwef")
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            upcomingRidesView.isHidden = false
            completedRidesView.isHidden = true
        case 1:
            upcomingRidesView.isHidden = true
            completedRidesView.isHidden = false
        default:
            break
        }
    }
    
    func configureUiTableView() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlSelected(_:)), for: .allEvents)
        upcomingRidesTable.register(UINib(nibName: "UpcomingRidesCell", bundle: nil), forCellReuseIdentifier: "upcomingRidesCell")
        completedRidesTable.register(UINib(nibName: "CompletedRidesCell", bundle: nil), forCellReuseIdentifier: "completedRidesCell")
    }
}
extension MyRidesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.tag == 0 ? upcomingRidesArray.count : completedRidesArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.tag == 0 ? 130 : 115
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "upcomingRidesCell", for: indexPath) as! UpcomingRidesCell
            cell.rideTiming.text = upcomingRidesArray[indexPath.row].travelTime
            cell.rideToAndFro.text = upcomingRidesArray[indexPath.row].toAndFroLocation
            cell.availableSeats.text = upcominSeatsAndPrice[indexPath.row].travelTime
            cell.priceOfSeat.text = upcominSeatsAndPrice[indexPath.row].toAndFroLocation
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "completedRidesCell", for: indexPath) as! CompletedRidesCell
            cell.rideTiming.text = completedRidesArray[indexPath.row].travelTime
            cell.rideToAndFro.text = completedRidesArray[indexPath.row].toAndFroLocation
            return cell
        }
    }
}

struct RidesModel {
    var travelTime = ""
    var toAndFroLocation = ""
}
