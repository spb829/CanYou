
//
//  BadgeDetailViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 18..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class BadgeDetailViewController: UIViewController {
    var badgeStore = DataController.sharedDataController.badgeStore
    var badge: Badge?
    @IBOutlet var badgeImageView: UIImageView!
    @IBOutlet var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let badge = self.badge else {
            return
        }
        
        if let image = badge.image {
            badgeImageView.image = image
        }
        
        contentLabel.text = badge.content
        self.navigationItem.title = badge.name
    }
}
