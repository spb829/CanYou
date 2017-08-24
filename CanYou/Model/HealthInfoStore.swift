//
//  HealthInfoStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct HealthInfoStore{
    static let sharedHealthInfoStore = HealthInfoStore()
    
    var idCount = 0
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
    
    @discardableResult func sortBy(time: Double) -> [HealthInfo] {
        return items.sorted(by: {$0.time < $1.time})
    }
}
