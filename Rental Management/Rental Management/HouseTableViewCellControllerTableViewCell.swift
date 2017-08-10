//
//  HouseTableViewCellControllerTableViewCell.swift
//  Rental Management
//
//  Created by mbeesley on 8/9/17.
//  Copyright © 2017 Jeen Technology. All rights reserved.
//

import UIKit

class HouseTableViewCellControllerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: Properties
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityStateZipLabel: UILabel!
    @IBOutlet weak var propertyImageView: UIImageView!
    
    
    
    
}
