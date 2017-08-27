//
//  RewardStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import RealmSwift

struct RewardStore{
    static let items: [Reward] = DataController.shared.rewards
    
    static let doneItems: [Reward] = DataController.shared.doneRewards
    static let toDoItems: [Reward] = DataController.shared.toDoRewards
    
    static let realm = try! Realm()
    
    static func addItem(_ item: Reward){
        try! realm.write {
            let currentUser = DataController.shared.currentUser
            item.user = currentUser
            currentUser.rewards.append(item)
        }
    }
}
