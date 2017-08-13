//
//  RewardStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct RewardStore{
    static let sharedRewardStore = RewardStore()
    
    var idCount = 0
    var items = [Reward]()
    
    private init() { }
    
    func findBy(id: Int) -> Reward? {
        return items.filter({$0.id == id}).first
    }
    
    func findBy(name: String) -> Reward? {
        return items.filter({$0.name == name}).first
    }
    
    func filterBy(name: String) -> [Reward] {
        return items.filter({$0.name == name})
    }
    
    func filterBy(userId: Int) -> [Reward] {
        return items.filter({$0.userId == userId})
    }
    
    func filterBy(purchased: Bool) -> [Reward] {
        return items.filter({$0.purchased == purchased})
    }
    
    
}
