//
//  AppDelegate.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 10..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        /*
         로컬 알림은 알림이 발생한 날짜와 시간으로 구성된 NSDate 객체를 결합한 UILocalNotification 클래스를 사용해야 한다.
         사용자에게 표시될 문장은 속성을 통해 설정할 수 있으며, 반복하는 간격과 알림 상자에 표시될 메시지를 옵션으로 지정할 수 있다.
         */
        
        let app = UIApplication.shared
        let notificationSettings = UIUserNotificationSettings(types: UIUserNotificationType([.alert, .sound /*, .Badge*/]), categories:nil)
        app.registerUserNotificationSettings(notificationSettings)
        
        let alarmType = Date().addingTimeInterval(10)       // 현재 시간에 10초를 더한후 이 시간에 LocalNotification 발생처리
        let notifyAlaram = UILocalNotification()
        
        notifyAlaram.fireDate = alarmType
        notifyAlaram.timeZone = NSTimeZone.default
        notifyAlaram.soundName = "bell_tree.mp3"
        notifyAlaram.alertBody = "30분뒤 회의예정입니다."
        app.scheduleLocalNotification(notifyAlaram)
        
        
        
        
        /*
         예약된 알림 취소하기
         예약된 알림은 처리되지 않은 알림 목록을 얻어 취소할 수 있다. 알림 목록은 NSArray 객체의 형태로 제공되며, cancelLocalNotification 메서드를 사용하여 각각의 알림을 취소할 수 있다. cancelAllLocalNotification 메서드를 이용하여 모든 알림을 취소할수도 있다.
         */
        //        let oldNotifications = app.scheduledLocalNotifications
        //        if oldNotifications!.count > 0 {
        //            print("Scheduled Local Notification Exist!!")
        //            app.cancelAllLocalNotifications()
        //        }
        
        
        
        
        /*
         즉시 로컬 알림 호출하기
         이미 예약된 알림의 fireDate속성을 무시하고 즉시 발생시킬 수도 있다.  아래는 현재 예약된 알림의 목록을 얻은후 이중 첫번째 알림을 즉시 화면에 표시한다.
         
         다만 즉시 로컬 알림을 호출하여도 취소하지 않는 이상 fireDate에 설정된 시간에 화면에 다시 표시된다.
         */
        let notifications = app.scheduledLocalNotifications
        if notifications!.count > 0 {
            app.presentLocalNotificationNow(notifications![0] as UILocalNotification)
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CanYou")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

