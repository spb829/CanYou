//
//  SettingBasicTableViewCell.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 17..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingBasicTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var cellButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}