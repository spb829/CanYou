//
//  SettingBirthTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingBirthTableViewController: BaseTableViewController {
    var currentUser = DataController.sharedDataController.currentUser
    
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        datePicker.date = currentUser.birth
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        currentUser.birth = datePicker.date
        self.navigationController?.popViewController(animated: true)
    }
}
