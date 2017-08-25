//
//  RewardViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 15..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardViewController: UIViewController {
    // MARK : - Properties
    var dataController = DataController.shared
    var isDoneList = false
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cansLabel: UILabel!
    @IBOutlet var listButton: UIButton!
    
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
}

// MARK: - Table view data source
extension RewardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isDoneList {
        case true:
            return RewardStore.doneItems.count + 1
        case false:
            return RewardStore.toDoItems.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items: [Reward]
        
        switch isDoneList {
        case true:
            items = RewardStore.doneItems
        case false:
            items = RewardStore.toDoItems
        }
        
        if indexPath.row == items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlusTableViewCell", for: indexPath) as! PlusTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RewardTableViewCell", for: indexPath) as! RewardTableViewCell
        
        let reward = items[indexPath.row]
        
        cell.titleLabel.text = reward.name
        cell.cansLabel.text = "\(reward.price) Cans"
        cell.contentLabel.text = reward.content
        
        if let image = reward.image {
            cell.rewardImageView.image = image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func toggleTapped(_ sender: UIButton) {
        isDoneList = !isDoneList
        
        switch isDoneList {
        case true:
            listButton.titleLabel?.text = "Not achieved List"
        case false:
            listButton.titleLabel?.text = "Achieved List"
        }
        
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.tableView.reloadSections(sections as IndexSet, with: .right)
    }
}

// MARK: - Navigation
extension RewardViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "goToRewardDetail" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = RewardStore.items[row]
                let vc = segue.destination as! RewardDetailViewController
                
                vc.reward = item
            }
        }
    }
}
