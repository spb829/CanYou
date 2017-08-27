//
//  HealthInfoTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 24..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class HealthInfoTableViewController: BaseTableViewController {
    // MARK : - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HealthInfoStore.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthInfoTableViewCell", for: indexPath) as! HealthInfoTableViewCell
        
        let item = HealthInfoStore.items[indexPath.row]
        
        var percent: Float = Float(DataController.shared.timeInterval / item.time)
        
        if percent > 1.0 {
            percent = 1.0
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        cell.titleLabel.text = item.name
        cell.progressView.progress = percent
        print(percent)

        return cell
    }
    
    
}
