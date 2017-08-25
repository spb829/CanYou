//
//  SettingAlarmTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 24..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingAlarmTableViewController: BaseTableViewController {
    // MARK : - Properties
    var currentUser = DataController.sharedDataController.currentUser
    @IBOutlet var alarmSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alarmSwitch.isOn = currentUser.randomAlarm
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        currentUser.randomAlarm = alarmSwitch.isOn
    }
}

