//
//  MenuDetailViewController.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 07/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    @IBOutlet weak var reportAnIncidentView: UIView!
    @IBOutlet weak var emergencySosMainView: UIView!
    @IBOutlet weak var emergencySosView: UIView!
    
    @IBOutlet var mediaViews: [UIView]!
    @IBOutlet weak var descTextView: UITextView!
    
    var navigationTitle:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUiViews()
    }
    func configureUiViews() {
        if navigationTitle == "Help Me" {
            reportAnIncidentView.isHidden = true
            emergencySosMainView.isHidden = false
        } else {
            reportAnIncidentView.isHidden = false
            emergencySosMainView.isHidden = true
        }
        self.navigationItem.setCustomTitleView(title: navigationTitle ?? String())
        self.navigationItem.leftBackButton(btnTarget: self, btnAction: #selector(backButtonPressed))
        emergencySosView.layer.cornerRadius = emergencySosView.frame.size.width/2
        emergencySosView.layer.borderColor = UIColor.orange.cgColor
        emergencySosView.layer.borderWidth = 3.0
        descTextView.layer.borderColor = UIColor.lightGray.cgColor
        descTextView.layer.borderWidth = 1.0
        for mediaView in mediaViews {
            mediaView.clipsToBounds = true
            mediaView.layer.cornerRadius = mediaView.frame.size.height/2
            mediaView.layer.borderWidth = 1.0
            mediaView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
