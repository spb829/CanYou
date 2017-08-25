//
//  User.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 12..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import RealmSwift

class User: RealmSwift.Object {
    // PrimaryKey
    @objc dynamic var id: String = UUID().uuidString
    
    // Properties
    @objc dynamic var name: String = ""
    @objc dynamic var birth: Date = Date()
    @objc dynamic var gender: String = "Male"
    @objc dynamic var startDate: Date = Date()
    
    @objc dynamic var cigaretteDaily: Int = 20
    @objc dynamic var cigarettePrice: Int = 4500
    
    @objc dynamic var canValue: Int = 0
    
    @objc dynamic var alarm: Bool = false
    @objc dynamic var randomAlarm: Bool = false
    
    // Realationships
    let rewards = List<Reward>()
    let badges = List<Badge>()
    
    let recentBadge: Badge? = nil
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
