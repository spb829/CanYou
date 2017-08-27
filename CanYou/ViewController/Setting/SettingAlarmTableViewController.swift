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
    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var randomAlarmSwitch: UISwitch!
    
    let notificationController = NotificationController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        randomAlarmSwitch.isOn = currentUser.randomAlarm
        alarmSwitch.isOn = currentUser.alarm
    }
    
    @IBAction func alarmSwitchValueChanged(_ sender: UISwitch) {
        try! realm.write {
            currentUser.alarm = sender.isOn
        }
        
        // alarm on, off
        switch sender.isOn {
        case true:
            randomAlarmSwitch.isEnabled = true
            // alarm on!
            notificationController.updateNotifications()
        case false:
            randomAlarmSwitch.isEnabled = false
            // all alarm off !
            notificationController.removeAllScheduledNotification()
        }
    }
    
    @IBAction func randomAlarmSwitchValueChanged(_ sender: UISwitch) {
        try! realm.write {
            currentUser.randomAlarm = sender.isOn
        }
        
        // random alarm on, off
        switch sender.isOn {
        case true:
            // random alarm on!
            notificationController.updateNotifications()
        case false:
            // random alarm off !
            notificationController.removeAllScheduledNotification()
        }
    }
}

