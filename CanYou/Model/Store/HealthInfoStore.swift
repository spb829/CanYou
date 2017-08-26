//
//  HealthInfoStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import RealmSwift

struct HealthInfoStore{
    static var items: [HealthInfo] = DataController.shared.healthInfos
    static let realm = try! Realm()
    
    static func createItem(name: String, time: Double, content: String) {
        try! realm.write {
            let item: HealthInfo = HealthInfo().then{
                $0.name = name
                $0.time = time
                $0.content = content
            }
            
            realm.add(item)
        }
    }
}
