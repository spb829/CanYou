//
//  SmokeStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation

struct SmokeStore{
    static let sharedSmokeStore = SmokeStore()
    var idCount = 0
    var items = [Smoke]()
    
    private init() { }
    
    func findBy(id: Int) -> Smoke? {
        return items.filter({$0.id == id}).first
    }
    
    func filterBy(userId: Int) -> [Smoke] {
        return items.filter({$0.userId == userId})
    }
    
    @discardableResult mutating func createSmoke(userId: Int) -> Smoke{
        //        let smoke = Smoke(random: true)
        let smoke = Smoke(userId: userId)
        
        items.append(smoke)
        return smoke
    }
    
    
}

