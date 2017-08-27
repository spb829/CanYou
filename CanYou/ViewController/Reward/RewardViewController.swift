//
//  RewardViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 15..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import RealmSwift

class RewardViewController: UIViewController {
    // MARK : - Properties
    var dataController = DataController.shared
    var isDoneList = false
    let realm = try! Realm()
    
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isDoneList { return }
        if indexPath.row == RewardStore.toDoItems.count { return }
        
        let item = RewardStore.toDoItems[indexPath.row]
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if dataController.currentUser.canValue >= item.price {
            let rewardAction = UIAlertAction(title: "나에게 보상하기", style: .default, handler: { (alertAction) -> Void in
                try! self.realm.write {
                    item.isDone = true
                }
                
                let sheet2 = UIAlertController(title: "보상완료", message: "\(item.name)을 보상 받았어요!", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                sheet2.addAction(okAction)
                
                self.tableView.reloadData()
                self.present(sheet2, animated: true, completion: nil)
            })
            
            sheet.addAction(rewardAction)
        }
        
        let deleteAction = UIAlertAction(title: "삭제하기", style: .destructive, handler: { (alertAction) -> Void in
            try! self.realm.write {
                self.realm.delete(item)
            }
            
            let sheet2 = UIAlertController(title: "삭제완료", message: "\(item.name)를 삭제했습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            sheet2.addAction(okAction)
            
            self.tableView.reloadData()
            self.present(sheet2, animated: true, completion: nil)
        })
        
        sheet.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        sheet.addAction(cancelAction)
        
        present(sheet, animated: true, completion: nil)
    }
    
    @IBAction func toggleTapped(_ sender: UIButton) {
        isDoneList = !isDoneList
        
        switch isDoneList {
        case true:
            listButton.setTitle("Achieved List", for: .normal)
        case false:
            listButton.setTitle("Not achieved List", for: .normal)
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
