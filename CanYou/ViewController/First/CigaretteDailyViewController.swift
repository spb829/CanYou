//
//  CigaretteDailyViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class CigaretteDailyViewController: BaseViewController {

    @IBOutlet var cigaretteDaily: UITextField!
    var dataController = DataController.sharedDataController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        let text: String = cigaretteDaily.text ?? ""
        if text.isEmpty {
            let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            sheet.message = "Input numbers!"
            let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            sheet.addAction(okAction)
            present(sheet, animated: true, completion: nil)
            return
        }
        
        dataController.currentUser.cigaretteDaily = Int(text)!
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nvc = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        
        present(nvc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}