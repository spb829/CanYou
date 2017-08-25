//
//  BadgeViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 15..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK : - Properties
    var dataController = DataController.shared
    var isDoneList = false
    
    @IBOutlet var tableView: UITableView!
    
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
        switch isDoneList {
        case true:
            return BadgeStore.doneItems.count
        case false:
            return BadgeStore.toDoItems.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BadgeTableViewCell", for: indexPath) as! BadgeTableViewCell
        let item: Badge
        
        switch isDoneList {
        case true:
            item = BadgeStore.doneItems[indexPath.row]
        case false:
            item = BadgeStore.toDoItems[indexPath.row]
        }
        
        cell.titleLabel.text = item.name
        cell.contentLabel.text = item.content
        
        if let image = item.image {
            cell.badgeImageView?.image = image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "goToBadgeDetail" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let item: Badge
                
                switch isDoneList {
                case true:
                    item = BadgeStore.doneItems[row]
                case false:
                    item = BadgeStore.toDoItems[row]
                }
                
                let vc = segue.destination as! BadgeDetailViewController
                
                vc.badge = item
            }
        }
    }

    @IBAction func toggleTapped(_ sender: UIButton) {
        isDoneList = !isDoneList
        
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.tableView.reloadSections(sections as IndexSet, with: .right)
    }
}
