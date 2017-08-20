//
//  SettingTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    var dataController = DataController.sharedDataController
//    var currentUser: User = DataController.sharedDataController.currentUser!
    var numberOfRows: [Int] = [4, 2, 4]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
