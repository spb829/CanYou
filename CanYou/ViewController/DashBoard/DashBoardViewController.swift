//
//  DashBoardViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import RealmSwift

class DashBoardViewController: UIViewController {
    // MARK : - Properties
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var savedMoneyView: UIView!
    
    let realm = try! Realm()
    let notificationController = NotificationController.shared
    var timer: Timer?
    var updateTimer: Timer?
    let timerController = TimerController.shared
    let currentUser = DataController.shared.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationController.updateNotifications()
        startTimer()
        
        savedMoneyView.layer.cornerRadius = 15
        savedMoneyView.clipsToBounds = true
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
        updateTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(updateThings), userInfo: nil, repeats: true)
    }
    
    @objc func updateLabels() {
        dayLabel.text = String(format: "%d", timerController.day)
        timeLabel.text = String(format: "%02d : %02d : %02d", timerController.hours, timerController.minutes, timerController.seconds)
    }

    @objc func updateThings() {
        let ti = DataController.shared.timeInterval
        if ti < 60 {
            imageView.image = UIImage(named: "양5")
        } else if ti < 70 {
            imageView.image = UIImage(named: "양4")
        } else if ti < 80 {
            imageView.image = UIImage(named: "양3")
        } else if ti < 90 {
            imageView.image = UIImage(named: "양2")
        } else {
            imageView.image = UIImage(named: "양1")
        }
        
        for badge in BadgeStore.toDoItems {
            switch badge.conditionType {
            case .time:
                // Time Badge
                if badge.conditionValue < ti {
                    try! realm.write {
                        badge.isDone = true
                    }
                }
            case .money:
                // Money Badge
                if Int(badge.conditionValue) < currentUser.savedMoney {
                    try! realm.write {
                        badge.isDone = true
                    }
                }
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
