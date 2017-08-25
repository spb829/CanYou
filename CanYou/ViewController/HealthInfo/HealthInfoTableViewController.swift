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
    var healthStore = DataController.sharedDataController.healthInfoStore
    
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
        return healthStore.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthInfoTableViewCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    
}
