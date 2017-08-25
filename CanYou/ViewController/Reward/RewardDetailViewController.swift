//
//  RewardDetailViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 18..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardDetailViewController: BaseViewController {
	// MARK : - Properties
    var rewardStore = DataController.sharedDataController.rewardStore
    var reward: Reward?

    @IBOutlet var rewardImageView: UIImageView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var cansLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let reward = self.reward else {
            return
        }
        
        if let image = reward.image {
            rewardImageView.image = image
        }
        
        contentLabel.text = reward.content
        cansLabel.text = "\(reward.price ?? 0) Cans"
        self.navigationItem.title = reward.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buyTapped(_ sender: UIButton) {
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
    }
}
