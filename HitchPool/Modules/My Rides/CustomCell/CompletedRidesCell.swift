//
//  CompletedRidesCell.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 08/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class CompletedRidesCell: UITableViewCell {

    @IBOutlet weak var rideToAndFro:UILabel!
    @IBOutlet weak var rideTiming:UILabel!
    @IBOutlet weak var viewDetails:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewDetails.addCornerRadius(cornerRadiusValue: 15)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
