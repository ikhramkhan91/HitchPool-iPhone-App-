//
//  SignUpViewController.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 08/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton:UIButton!
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var confirmPasswordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUiViews()
        if !isFromSignIn {
            isFromSignUp = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configureUiViews() {
        self.navigationItem.setCustomTitleView(title: "Sign Up")
        let barbuttonItem = UIBarButtonItem()
        self.navigationItem.leftBarButtonItem = barbuttonItem
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
    }

    @objc func loginButtonPressed() {
        if isFromSignIn {
            self.navigationController?.popViewController(animated: true)
        } else {
            let viewControllerToPush = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(viewControllerToPush, animated: true)
        }
    }
    @objc func signUpButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
