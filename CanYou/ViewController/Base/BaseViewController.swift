//
//  BaseViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class BaseViewController: UIViewController {
    let realm = try! Realm()
    var currentUser = DataController.shared.currentUser
    var dataController = DataController.shared
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK : Methods for Background
    func addBackgroundView() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "Gradation")
        
        // change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Realm Browser file URL
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addBackgroundView()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK : Methods for Keyboard
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension BaseViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Tapped in notification")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("Notification being triggered")
        completionHandler( [.alert,.sound,.badge])
    }
}

