//
//  RewardTableViewCell.swift
//  CanYou
//
//  Created by Mac Pro on 2017. 8. 20..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardTableViewCell: UITableViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var cansLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
