//
//  HomeScreenViewController.swift
//  HitchPool
//
//  Created by Pravina Venugopal on 06/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit
var fromCity = ""
var toCity = ""
var isFromSignUp = false
var isFromSignIn = false
class HomeScreenViewController: UIViewController {

    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var signInView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var offerRideButton: UIButton!
    @IBOutlet weak var needRideButton: UIButton!
    @IBOutlet weak var goingButton: UIButton!
    @IBOutlet weak var goingLabel: UILabel!
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var fromLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUiViews()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        blurView.isHidden = true
        signInView.isHidden = true
        if !fromCity.isEmpty {
            fromLabel.text = fromCity
        }
        if !toCity.isEmpty {
            goingLabel.text = toCity
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configureUiViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        blurView.addGestureRecognizer(tap)
        self.navigationController?.navigationBar.isHidden = true
        needRideButton.addBorderAndCornerRadius(borderWidth: 1.0, borderColour: UIColor.appThemeColour(), cornerRadiusValue: 5)
        offerRideButton.addBorderAndCornerRadius(borderWidth: 1.0, borderColour: UIColor.white, cornerRadiusValue: 5)
        fromButton.tag = 1
        goingButton.tag = 2
        fromButton.addTarget(self, action: #selector(chooseLocationButton(sender:)), for: .touchUpInside)
        goingButton.addTarget(self, action: #selector(chooseLocationButton(sender:)), for: .touchUpInside)
        offerRideButton.addTarget(self, action: #selector(offerRideButtonPressed(sender:)), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(signUpOrLoginButtonPressed(sender:)), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpOrLoginButtonPressed(sender:)), for: .touchUpInside)
    }
    
    @IBAction func signUpOrLoginButtonPressed(sender: UIButton) {
        switch sender.tag {
            case 0:
                let viewControllerToPresent = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                viewControllerToPresent.modalPresentationStyle = UIModalPresentationStyle.currentContext
                viewControllerToPresent.modalTransitionStyle = .coverVertical
                let nav = UINavigationController(rootViewController: viewControllerToPresent)
                self.navigationController?.present(nav, animated: true, completion: nil)
            case 1:
                let viewControllerToPresent = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
                viewControllerToPresent.modalPresentationStyle = UIModalPresentationStyle.currentContext
                viewControllerToPresent.modalTransitionStyle = .coverVertical
                let nav = UINavigationController(rootViewController: viewControllerToPresent)
                self.navigationController?.present(nav, animated: true, completion: nil)
            default:
                break
        }
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        blurView.isHidden = true
        signInView.isHidden = true
    }
    @IBAction func offerRideButtonPressed(sender: UIButton) {
        blurView.isHidden = false
        signInView.isHidden = false
    }
    @IBAction func chooseLocationButton(sender: UIButton) {
        let viewControllerToPresent = storyboard?.instantiateViewController(withIdentifier: "LocationScreenViewController") as! LocationScreenViewController
        switch sender.tag {
            case 1:
                viewControllerToPresent.locationSearchTitle = "From"
            case 2:
                viewControllerToPresent.locationSearchTitle = "Going To"
            default:
                break
        }
        self.navigationController?.present(viewControllerToPresent, animated: true, completion: nil)
    }
}
