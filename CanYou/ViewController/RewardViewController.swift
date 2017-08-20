//
//  RewardViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 15..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var dataController = DataController.sharedDataController
    var rewardStore = DataController.sharedDataController.rewardStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewardStore.items.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == rewardStore.items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlusTableViewCell", for: indexPath) as! PlusTableViewCell
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RewardTableViewCell", for: indexPath) as! RewardTableViewCell
        
        let reward = rewardStore.items[indexPath.row]
        
        cell.titleLabel.text = reward.name!
        cell.cansLabel.text = "\(reward.price ?? 0) Cans"
        cell.contentLabel.text = reward.content!
        
        return cell
    }
    
    
}
