//
//  SettingNameTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingNameTableViewController: UITableViewController {
    var currentUser = DataController.sharedDataController.currentUser

    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.placeholder = currentUser.name
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        if let name = nameTextField.text {
            currentUser.name = name
            
            self.navigationController?.popViewController(animated: true)
        } else {
            print("wrong")
        }
    }
}
