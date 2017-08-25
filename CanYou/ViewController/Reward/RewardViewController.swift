//
//  RewardViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 15..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    // MARK : - Properties
    var dataController = DataController.sharedDataController
    var rewardStore = DataController.sharedDataController.rewardStore
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cansLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cansLabel.text = "\(dataController.currentUser.canValue) Cans"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        print("numberofsectinos")
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("rows")
        return rewardStore.items.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("cells")
        if indexPath.row == rewardStore.items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlusTableViewCell", for: indexPath) as! PlusTableViewCell
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RewardTableViewCell", for: indexPath) as! RewardTableViewCell
        
        let reward = rewardStore.items[indexPath.row]
        
        cell.titleLabel.text = reward.name!
        cell.cansLabel.text = "\(reward.price ?? 0) Cans"
        cell.contentLabel.text = reward.content!
        
        if let image = reward.image {
            cell.rewardImageView.image = image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "goToRewardDetail" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = rewardStore.items[row]
                let vc = segue.destination as! RewardDetailViewController
                
                vc.reward = item
            }
        }
    }
    
    @IBAction func toggleTapped(_ sender: UIButton) {
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.tableView.reloadSections(sections as IndexSet, with: .automatic)
    }
}
