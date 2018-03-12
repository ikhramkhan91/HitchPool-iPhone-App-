//
//  LoginViewController.swift
//  HitchPool
//
//  Created by Pravina Venugopal on 08/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var closeButton:UIButton!
    @IBOutlet weak var signUpButton:UIButton!
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUiViews()
        if !isFromSignUp {
            isFromSignIn = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureUiViews() {
        self.navigationItem.setCustomTitleView(title: "Sign In")
        let barbuttonItem = UIBarButtonItem()
        self.navigationItem.leftBarButtonItem = barbuttonItem
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
    }

    @objc func dismissButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func loginButtonPressed() {
        var alertMessage = ""
        if (emailTextField.text?.isEmpty)! {
            alertMessage = "Please enter email"
        } else if !(emailTextField.text?.isEmail)! {
            alertMessage = "Please enter valid email"
        } else if (passwordTextField.text?.isEmpty)! {
            alertMessage = "Please enter password"
        } else {
            if emailTextField.text == "Demo@gmail.com" && passwordTextField.text == "demo123" {
                self.view.endEditing(true)
                self.dismiss(animated: true, completion: nil)

            } else {
               alertMessage = "Invalid username or password"
            }
        }
        if !alertMessage.isEmpty {
            AppAlertView.sharedInstance.showAppAlertView(vc: self, message: alertMessage)
        }
    }
    @objc func signUpButtonPressed() {
        if isFromSignUp {
            self.navigationController?.popViewController(animated: true)
        } else {
            let viewControllerToPush = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(viewControllerToPush, animated: true)
        }
    }
}
