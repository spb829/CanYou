//
//  HealthInfoStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

struct HealthInfoStore{
    static let sharedHealthInfoStore = HealthInfoStore()
    
    static var idCount = 0
    var items = [HealthInfo]()
    
    private init() {
        
    }
    
    func findBy(id: Int) -> HealthInfo? {
        return items.filter({$0.id == id}).first
    }
    
    func findBy(name: String) -> HealthInfo? {
        return items.filter({$0.name == name}).first
    }
    
    func filterBy(name: String) -> [HealthInfo] {
        return items.filter({$0.name == name})
    }
    
    @discardableResult mutating func sortBy(time: Double) -> [HealthInfo] {
        items = items.sorted(by: {$0.time < $1.time})
        return items
    }
}
