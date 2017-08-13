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
    static var idCount = 0
    static var items = [Reward]()
    
    static func findBy(id: Int) -> Reward? {
        for item in items {
            if item.id == id {
                return item
            }
        }
        
        return nil
    }
    
    static func findBy(name: String) -> Reward? {
        for item in items {
            if item.name == name {
                return item
            }
        }
        
        return nil
    }
    
    static func filterBy(name: String) -> [Reward] {
        return items.filter({$0.name == name})
    }
    
    static func filterBy(purchased: Bool) -> [Reward] {
        return items.filter({$0.purchased == purchased})
    }
    
    static func add(reward: Reward){
        items.append(reward)
    }
    
}
