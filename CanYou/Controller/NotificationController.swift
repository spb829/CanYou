//
//  NotificationController.swift
//  CanYou
//
//  Created by Mac Pro on 2017. 8. 25..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class NotificationController {
    static let shared = NotificationController()
    
    // MARK: - Properties
    var center = UNUserNotificationCenter.current()
    let dataController = DataController.shared
    let realm = try! Realm()
    let currentUser = DataController.shared.currentUser
    
    // MARK: - Methods
    
    func requestAuthorization(completion: @escaping (_ granted: Bool) -> Void) {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        center.requestAuthorization(options: options) { (granted, error) in
            if let error = error {
                print("Request Authorization Failed (\(error), \(error.localizedDescription))")
            }
            
             completion(granted)
        }
    }
    
    func updateNotifications() {
        if !currentUser.alarm { return }
//        print("1")
        self.removeAllScheduledNotification()
        center.getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization() {(granted) -> Void in
                    guard granted else { return }
                }
            case .authorized:
                break
            case .denied:
                print("Not Allowed !")
                return
            }
        }
        
        for badge in BadgeStore.toDoItems {
//            print(badge.condition)
            switch badge.conditionType {
            case .time:
                // Time Badge
                var timeinterval = badge.conditionValue - dataController.timeInterval
                if timeinterval < 0 {
                    timeinterval = 0
                }
                self.scheduleNotification(byTimeInterval: timeinterval,
                                          title: badge.name,
                                          content: badge.content)
//                    print("content:\(badge.content)")
//                print("\(timeinterval)초 후 \(badge.content)알람")
            case .money:
                // Money Badge
                var timeinterval = (currentUser.cigarPricePerTI * badge.conditionValue) - dataController.timeInterval
                if timeinterval < 0 {
                    timeinterval = 0
                }
                self.scheduleNotification(byTimeInterval: timeinterval,
                                          title: badge.name,
                                          content: badge.content)
                //                    print("content:\(badge.content)")
//                print("\(timeinterval)초 후 \(badge.content)알람")
            default:
                break
            }
        }
        
        if !currentUser.randomAlarm { return }
        
        
    }
    
    func removeAllScheduledNotification() {
        center.removeAllPendingNotificationRequests()
    }
    
    func scheduleNotification(byTimeInterval interval: TimeInterval, title: String, content body: String) {
        // content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        
        let identifier = "noti_\(title)"
//        print(identifier)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print("error: \(error)")
            }
        })
        
        print("added")
        
    }
}
