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
    
//    Reward Model
//    let id: Int
//    let userId: Int
//
//    var name: String?
//    var image: UIImage?
//    var content: String?
//
//    var price: Int?
//    var purchased: Bool
    
    private init() {
        print("RewardStore init called")
        // 초기 데이터
        items.append(Reward(userId: 0).then {
            $0.name = "애플워치 사기"
            $0.image = UIImage(named: "applewatch")
            $0.content = "삽시다"
            $0.price = 2000
        })
        
        items.append(Reward(userId: 0).then {
            $0.name = "1"
            $0.content = "2"
            $0.price = 3
        })
        
        items.append(Reward(userId: 0).then {
            $0.name = "1"
            $0.content = "2"
            $0.price = 3
        })
        
        items.append(Reward(userId: 0).then {
            $0.name = "1"
            $0.content = "2"
            $0.price = 3
        })
        
        print(items)
    }
    
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
    
    mutating func add(_ item: Reward) {
        self.items.append(item)
    }
}
