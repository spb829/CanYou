//
//  BadgeStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct BadgeStore{
    static let sharedBadgeStore = BadgeStore()
    
    var idCount = 0
    var items = [Badge]()
    
    private init() { }
    
    func findBy(id: Int) -> Badge? {
        return items.filter({$0.id == id}).first
    }
    
    func findBy(name: String) -> Badge? {
        return items.filter({$0.name == name}).first
    }
    
    func filterBy(name: String) -> [Badge] {
        return items.filter({$0.name == name})
    }
    
    func filterBy(conditionType: ConditionType) -> [Badge] {
        return items.filter({$0.conditionType == conditionType})
    }
    
    
}
