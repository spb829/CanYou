//
//  BadgeStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

struct BadgeStore{
    static let sharedBadgeStore = BadgeStore()
    static var idCount = 0
    var items = [Badge]()
    var doneItems = [BadgeUser]()
    
    private init() {
        
        items.append(Badge().then{
            $0.name = "24hours"
            $0.image = UIImage(named: "badge-24hours")
            $0.content = "Good start !"
        })
        
        items.append(Badge().then{
            $0.name = "48hours"
            $0.image = UIImage(named: "badge-48hours")
            $0.content = "Nice"
        })
        
        items.append(Badge().then{
            $0.name = "72hours"
            $0.image = UIImage(named: "badge-72hours")
            $0.content = "Keep it up !"
        })
        
        items.append(Badge().then{
            $0.name = "A Week"
            $0.image = UIImage(named: "badge-7days")
            $0.content = "Getting better"
        })
        
        items.append(Badge().then{
            $0.name = "Money saved"
            $0.image = UIImage(named: "badge-10000won")
            $0.content = "10,000 won saved!"
        })
        
        items.append(Badge().then{
            $0.name = "Money saved"
            $0.image = UIImage(named: "badge-moneysave")
            $0.content = "100,000 won saved!"
        })
        
        items.append(Badge().then{
            $0.name = "First reward"
            $0.image = UIImage(named: "badge-1reward")
            $0.content = "Purchased first reward"
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
