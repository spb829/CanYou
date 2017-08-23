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
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nvc = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        
        present(nvc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
