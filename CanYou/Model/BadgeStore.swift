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
    
    private init() {
        
        items.append(Badge().then{
            $0.name = "금연 1일"
            $0.image = UIImage(named: "badge-24hours")
            $0.content = "천리길도 한 걸음 부터 !"
        })
        
        items.append(Badge().then{
            $0.name = "금연 2일"
            $0.image = UIImage(named: "badge-48hours")
            $0.content = "좀 하네"
        })
        
        items.append(Badge().then{
            $0.name = "금연 3일"
            $0.image = UIImage(named: "badge-72hours")
            $0.content = "첫 번째 고비다!"
        })
        
        items.append(Badge().then{
            $0.name = "금연 1주일"
            $0.image = UIImage(named: "badge-7days")
            $0.content = "1주일 달성!"
        })
        
        items.append(Badge().then{
            $0.name = "만원 절약"
            $0.image = UIImage(named: "badge-10000won")
            $0.content = "금연하여 만원을 절약했습니다!"
        })
        
        items.append(Badge().then{
            $0.name = "100만원 절약"
            $0.image = UIImage(named: "badge-moneysave")
            $0.content = "금연하여 100만원을 절약했습니다!"
        })
        
        items.append(Badge().then{
            $0.name = "보상 1개 구매"
            $0.image = UIImage(named: "badge-1reward")
            $0.content = "보상을 받았어요~!"
        })
    }
    
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
