//
//  DashBoardViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {
    // MARK : - Properties
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var savedMoneyView: UIView!
    
    let notificationController = NotificationController.shared
    var timer: Timer?
    let timerController = TimerController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationController.updateNotifications()
        startTimer()
        
        savedMoneyView.layer.cornerRadius = 15
        savedMoneyView.clipsToBounds = true
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
    }
    
    @objc func updateLabels() {
//        print(DataController.shared.timeInterval)
        dayLabel.text = String(format: "%d", timerController.day)
        timeLabel.text = String(format: "%02d : %02d : %02d", timerController.hours, timerController.minutes, timerController.seconds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
