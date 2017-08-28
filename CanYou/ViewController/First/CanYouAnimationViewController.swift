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
    
    var timer: Timer!
    var timer2: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 3.6, target: self, selector: #selector(animateRepeat1), userInfo: nil, repeats: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8, execute: {
            self.timer2 = Timer.scheduledTimer(timeInterval: 3.6, target: self, selector: #selector(self.animateRepeat2), userInfo: nil, repeats: true)
        })
        
    }
    
    func temp() {
        
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
    
    @objc func animateRepeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            AnimationController.fadeTransition(self.label, for: 1.2)
            self.label.text = "You Can !"
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
            AnimationController.fadeTransition(self.label, for: 1.2)
            self.label.text = "Can You ?"
        })
    }
    
    @objc func animateRepeat1() {
        print(1)
        AnimationController.fadeTransition(self.label, for: 1.2)
        self.label.text = "You Can !"
    }
    
    @objc func animateRepeat2() {
        print(2)
        AnimationController.fadeTransition(self.label, for: 1.2)
        self.label.text = "Can You ?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
