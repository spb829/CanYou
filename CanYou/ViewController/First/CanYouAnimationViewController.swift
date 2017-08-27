//
//  CanYouAnimationViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class CanYouAnimationViewController: UIViewController {
    @IBOutlet var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataController = DataController.shared
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            AnimationController.fadeTransition(self.label, for: 1.0)
            self.label.text = "You Can !"
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            // Load Storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
//            let dataController = DataController.shared
            
            // Instantiate View Controller
            var viewController: UIViewController!
            if dataController.currentUser.isNew {
                viewController = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
            } else {
                viewController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            }
            
            viewController.modalTransitionStyle = .crossDissolve
            
            self.present(viewController, animated: true, completion: nil)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
