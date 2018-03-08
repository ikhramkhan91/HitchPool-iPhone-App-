//
//  UpcomingRidesCell.swift
//  HitchPool
//
//  Created by Rizwan Nasar on 08/03/18.
//  Copyright © 2018 hitchpool. All rights reserved.
//

import UIKit

class UpcomingRidesCell: UITableViewCell {

    @IBOutlet weak var availableSeats:UILabel!
    @IBOutlet weak var priceOfSeat:UILabel!
    @IBOutlet weak var rideToAndFro:UILabel!
    @IBOutlet weak var rideTiming:UILabel!
    @IBOutlet var buttonArray:[UIButton]!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for button in buttonArray {
            button.addCornerRadius(cornerRadiusValue: 15)
            button.clipsToBounds = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
