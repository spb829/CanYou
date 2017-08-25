//
//  DataController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import RealmSwift

struct DataController {
    static let shared = DataController()
    static let realm = try! Realm()
    
    let version = "v1.0.0"
    let dateFormatter = DateFormatter().then {
        $0.dateFormat = "yyyy. MM. dd"
    }
    
    var currentUser: User
    
    var rewards: [Reward] {
        return currentUser.rewards.toArray()
    }
    var healthInfos: [HealthInfo] {
        return try! Realm().objects(HealthInfo.self).toArray()
    }
    var badges: [Badge] {
        return currentUser.badges.toArray()
    }
    var toDoBadges: [Badge] {
        return self.badges.filter({$0.isDone == false})
    }
    var doneBadges: [Badge] {
        return self.badges.filter({$0.isDone == true})
    }

    private init() {
        currentUser = UserStore.currentUser()!
        initBadges()
    }
    
    func initBadges() {
        if currentUser.badges.count > 5 {
            return
        }
        BadgeStore.createItem(user: currentUser, name: "24hours", imageName: "badge-24hours", content: "Good start !", conditionType: .time, conditionValue: 86400)
        BadgeStore.createItem(user: currentUser, name: "48hours", imageName: "badge-48hours", content: "Nice", conditionType: .time, conditionValue: 172800)
        BadgeStore.createItem(user: currentUser, name: "72hours", imageName: "badge-72hours", content: "Keep it up !", conditionType: .time, conditionValue: 259200)
        BadgeStore.createItem(user: currentUser, name: "A Week", imageName: "badge-7days", content: "Getting better", conditionType: .time, conditionValue: 604800)
        BadgeStore.createItem(user: currentUser, name: "Money saved", imageName: "badge-10000won", content: "10,000 won saved!", conditionType: .money, conditionValue: 10000)
        BadgeStore.createItem(user: currentUser, name: "Money saved", imageName: "badge-moneysave", content: "100,000 won saved!", conditionType: .money, conditionValue: 100000)
        BadgeStore.createItem(user: currentUser, name: "First reward", imageName: "badge-1reward", content: "You got a reward", conditionType: .reward, conditionValue: 1)
    }
}
