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

    override func viewDidLoad() {
        super.viewDidLoad()
        applyColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
