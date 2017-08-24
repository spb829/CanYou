//
//  UYNotificationDelegate.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 21..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UserNotifications

class UYLNotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // Play sound and show alert to the user
        completionHandler([.alert,.sound])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,       didReceive response: UNNotificationResponse,       withCompletionHandler completionHandler: @escaping () -> Void) {
        // Determine the user action
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
        case "Delete":
            print("Delete")
        default:
            print("Unknown action")
            
        }
        completionHandler()
    }
    
}
