//
//  SettingNameTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class SettingNameTableViewController: BaseTableViewController {
    // MARK : - Properties
    var currentUser = DataController.sharedDataController.currentUser

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
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

extension SettingNameTableViewController: UITextFieldDelegate {
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    // MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}
