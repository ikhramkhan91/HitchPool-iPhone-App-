//
//  UIExtensions.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 06/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit
extension UIButton {
    func addBorderAndCornerRadius(borderWidth:CGFloat,borderColour:UIColor,cornerRadiusValue:CGFloat) {
        layer.cornerRadius = cornerRadiusValue
        layer.borderWidth = borderWidth
        layer.borderColor = borderColour.cgColor
    }
    func addCornerRadius(cornerRadiusValue:CGFloat) {
        layer.cornerRadius = cornerRadiusValue
    }
}
extension UIColor {
    class func appThemeColour() -> UIColor {
        return UIColor(hexString: "#EF6666")
    }
    public convenience init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        if hexString.hasPrefix("0X") {
            scanner.scanLocation = 2
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
public extension String {
    public var isEmail: Bool {
        return matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    }
    func matches(pattern: String) -> Bool {
        return range(of: pattern,
                     options: String.CompareOptions.regularExpression,
                     range: nil, locale: nil) != nil
    }
}

extension UINavigationItem {
    func setCustomTitleView(title:String) {
        let mainTitle = UILabel()
        mainTitle.text = title
        mainTitle.font = UIFont.systemFont(ofSize: 20)
        mainTitle.sizeToFit()
        mainTitle.textColor = UIColor.white
        mainTitle.textAlignment = .right
        let mainTitleView = UIStackView(arrangedSubviews: [mainTitle])
        mainTitleView.distribution = .equalCentering
        mainTitleView.axis = .horizontal
        self.titleView?.backgroundColor = UIColor.appThemeColour()
        mainTitleView.frame = CGRect(x: 0, y: 0, width: mainTitle.frame.size.width, height: 35)
        self.titleView = mainTitleView
    }
    func leftBackButton(btnTarget:AnyObject!, btnAction:Selector) {
        let barbuttonItem = UIBarButtonItem(image: UIImage(named: "icon_back"), style: .plain, target: btnTarget, action: btnAction)
        self.leftBarButtonItem = barbuttonItem
    }
}
