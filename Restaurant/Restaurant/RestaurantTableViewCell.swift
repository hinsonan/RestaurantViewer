//
//  RestaurantTableViewCell.swift
//  Restaurant
//
//  Created by Andrew Hinson on 10/25/17.
//  Copyright © 2017 Andrew Hinson. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restType: UILabel!
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
