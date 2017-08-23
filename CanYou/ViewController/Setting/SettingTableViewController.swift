//
//  SettingTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingTableViewController: BaseTableViewController {
    var dataController = DataController.sharedDataController
    var currentUser = DataController.sharedDataController.currentUser
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthLabel: UILabel!
    @IBOutlet var startdateLabel: UILabel!
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var versionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = currentUser.name
        genderLabel.text = currentUser.gender
//        birthLabel.text = String(currentUser.birth)
//        startdateLabel.text = currentUser.startDate
        versionLabel.text = dataController.version
        
    }
}
