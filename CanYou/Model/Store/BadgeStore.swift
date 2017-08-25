//
//  BadgeStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import RealmSwift

struct BadgeStore{
    static let items: [Badge] = DataController.shared.badges
    static let doneItems: [Badge] = DataController.shared.doneBadges
    static let toDoItems: [Badge] = DataController.shared.toDoBadges
    
    static let realm = try! Realm()
    
    static func createItem(user: User, name: String, imageName: String, content: String, conditionType: ConditionType, conditionValue: Double) {
        try! realm.write {
            let badge: Badge = Badge().then{
                $0.user = user
                $0.name = name
                $0.imageName = imageName
                $0.content = content
                $0.conditionType = conditionType
                $0.conditionValue = conditionValue
            }
            
            user.badges.append(badge)
            realm.add(badge)
        }
    }
}
