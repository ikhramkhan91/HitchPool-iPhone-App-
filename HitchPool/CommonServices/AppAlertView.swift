//
//  AppAlertView.swift
//  HitchPool
//
//  Created by Pravina Venugopal on 09/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class AppAlertView: NSObject {
    public static let sharedInstance = AppAlertView()
    private override init() {
    }
    
    func showAppAlertView(vc:UIViewController, message:String) {
        let actionSheetController:UIAlertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        vc.present(actionSheetController, animated: true, completion: nil)
    }
    func showAppAlertViewWithTitle(vc:UIViewController, message:String, title:String) {
        let actionSheetController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action  in
            //Hides the screen
            vc.navigationController?.popViewController(animated: true)
        }
        actionSheetController.addAction(cancelAction)
        vc.present(actionSheetController, animated: true, completion: nil)
    }
}
