//
//  Badge.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import RealmSwift

enum ConditionType: String {
    case time
    case cigarette
    case money
    case reward
    
    static let allValues = [time,
                            cigarette,
                            money,
                            reward]
}

class Badge: RealmSwift.Object {
    // PrimaryKey
    @objc dynamic var id: String = UUID().uuidString
    
    // Properties
    @objc dynamic var name: String = ""
    @objc dynamic var imageName: String = ""
    var image: UIImage? {
        return ImageController.convertToImage(fromName: imageName)
    }
    @objc dynamic var content: String = ""
    
    // Condition - To get badge
    @objc dynamic var condition: String = ConditionType.time.rawValue
    var conditionType: ConditionType {
        get {
            return ConditionType(rawValue: condition)!
        }
        set (conditionType){
            condition = conditionType.rawValue
        }
    }
    @objc dynamic var conditionValue: Double = 0
    @objc dynamic var isDone: Bool = false
    
    // Relationship
    @objc dynamic var user: User? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
