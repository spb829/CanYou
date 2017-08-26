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
        cansLabel.text = "\(reward.price) Cans"
        self.navigationItem.title = reward.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buyTapped(_ sender: UIButton) {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        sheet.message = "Must be bigger than 0 !"
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: {
            // 구매 확인
            
            self.navigationController?.popViewController(animated: true)
            
            let sheet2 = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            sheet2.message = "Purchased !"
            present(sheet2, animated: true, completion: nil)
        })
        sheet.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(cancelAction)
        present(sheet, animated: true, completion: nil)
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        
    }
}
