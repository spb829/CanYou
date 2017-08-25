//
//  HealthInfo.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then
import RealmSwift

class HealthInfo: RealmSwift.Object {
    // PrimaryKey
    @objc dynamic var id: String = UUID().uuidString
    
    // Properties
    @objc dynamic var name: String = ""
    @objc dynamic var time: Double = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

