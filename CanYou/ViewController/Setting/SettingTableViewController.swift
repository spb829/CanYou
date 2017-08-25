//
//  SettingTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingTableViewController: BaseTableViewController {
    // MARK : - Properties
    var dataController = DataController.sharedDataController
    var currentUser = DataController.sharedDataController.currentUser
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthLabel: UILabel!
    @IBOutlet var startdateLabel: UILabel!
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var alarmLabel: UILabel!
    @IBOutlet var cigaretteDailyLabel: UILabel!
    @IBOutlet var cigarettePriceLabel: UILabel!
    
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
        birthLabel.text = dataController.dateFormatter.string(from: currentUser.birth)
        startdateLabel.text = dataController.dateFormatter.string(from: currentUser.startDate)
        versionLabel.text = dataController.version
        if currentUser.randomAlarm {
            alarmLabel.text = "On"
        } else {
            alarmLabel.text = "Off"
        }
        cigaretteDailyLabel.text = String(currentUser.cigaretteDaily)
//        cigarettePriceLabel.text = String(currentUser.cigarettePrice)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
//        self.dismiss(animated: true, completion: nil)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        navigationController?.view.layer.add(transition, forKey: nil)
        _ = navigationController?.popViewController(animated: false)
    }
}
