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
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var savedMoneyView: UIView!
    @IBOutlet var savedMoneyLabel: UILabel!
    
    @IBOutlet var savedCigView: UIView!
    @IBOutlet var savedCigLabel: UILabel!
    
    let realm = try! Realm()
    let notificationController = NotificationController.shared
    var timer: Timer?
    var updateTimer: Timer?
    let timerController = TimerController.shared
    let dataController = DataController.shared
    let currentUser = DataController.shared.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationController.updateNotifications()
        startTimer()
        initScrollView()
        savedMoneyView.layer.cornerRadius = 15
        savedMoneyView.clipsToBounds = true
        savedCigView.layer.cornerRadius = 15
        savedCigView.clipsToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 한번 씩 미리 호줄 해줌.
        updateLabels()
        updateThings()
    }
    
    func initScrollView() {
        let lastView: UIView! = scrollView.subviews.last
        let height = lastView.frame.size.height
        let pos = lastView.frame.origin.y
        let sizeOfContent = height + pos + 10
        let size = self.scrollView.frame.size
//        scrollView.contentSize.height = sizeOfContent
        
        self.scrollView.contentSize = CGSize(width: size.width, height: sizeOfContent)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
        updateTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(updateThings), userInfo: nil, repeats: true)
    }
    
    @objc func updateLabels() {
        let item = dataController.lastHealthInfo
        var percent: Float = Float(dataController.timeInterval / item.time)
        if percent > 1.0 {
            percent = 1.0
        }
        contentLabel.text = item.name
        progressView.progress = percent
        dayLabel.text = String(format: "%d", timerController.day)
        timeLabel.text = String(format: "%02d : %02d : %02d", timerController.hours, timerController.minutes, timerController.seconds)
        savedMoneyLabel.text = "\(currentUser.savedMoney) Won"
        savedCigLabel.text = "\(currentUser.savedCigarette)"
        
    }

    @objc func updateThings() {
        let ti = DataController.shared.timeInterval
        if ti < 60 {
            imageView.image = UIImage(named: "sheep5")
        } else if ti < 70 {
            imageView.image = UIImage(named: "sheep4")
        } else if ti < 80 {
            imageView.image = UIImage(named: "sheep3")
        } else if ti < 90 {
            imageView.image = UIImage(named: "sheep2")
        } else {
            imageView.image = UIImage(named: "sheep1")
        }
        
        for badge in BadgeStore.toDoItems {
            switch badge.conditionType {
            case .time:
                // Time Badge
                if badge.conditionValue < ti {
                    try! realm.write {
                        badge.isDone = true
                        currentUser.canValue += 100
                    }
                }
            case .money:
                // Money Badge
                if Int(badge.conditionValue) < currentUser.savedMoney {
                    try! realm.write {
                        badge.isDone = true
                        currentUser.canValue += 100
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
