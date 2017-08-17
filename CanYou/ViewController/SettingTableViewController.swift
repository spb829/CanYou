//
//  SettingTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then

class SettingTableViewController: UITableViewController {
    let structure = SettingTableViewStructure()
    var dataController = DataController.sharedDataController
//    var currentUser: User = DataController.sharedDataController.currentUser!
    var numberOfRows: [Int] = [4, 2, 4]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
//        return structure.numberOfSections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return structure.numberOfRows(section)
//        return 2
        return numberOfRows[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cellInfo = structure.sections[section].cells[row]

        switch cellInfo.type {
        case .basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellInfo.type.rawValue, for: indexPath) as! SettingBasicTableViewCell
            cell.titleLabel.text = cellInfo.title
            cell.contentLabel.text = cellInfo.content

            return cell
        case .switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellInfo.type.rawValue, for: indexPath) as! SettingSwitchTableViewCell
            cell.titleLabel.text = cellInfo.title
            cell.settingSwitch.isOn = cellInfo.isOn

            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return structure.sections[section].title
    }
}
