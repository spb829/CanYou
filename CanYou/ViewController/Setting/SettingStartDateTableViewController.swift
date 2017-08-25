//
//  SettingStartDateTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingStartDateTableViewController: BaseTableViewController {
    // MARK : - Properties
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        datePicker.date = currentUser.startDate
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        try! realm.write {
            currentUser.startDate = datePicker.date
        }
        self.navigationController?.popViewController(animated: true)
    }
}


