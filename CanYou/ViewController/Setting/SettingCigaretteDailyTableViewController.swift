//
//  SettingCigaretteDailyTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 24..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingCigaretteDailyTableViewController: BaseTableViewController {
    // MARK : - Properties
    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.placeholder = String(currentUser.cigaretteDaily)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem){
        
        try! realm.write {
            if let value = Int(textField.text ?? "0") {
                currentUser.cigaretteDaily = value
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}
