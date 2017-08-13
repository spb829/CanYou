//
//  UserStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct UserStore{
    static var idCount = 0
    static var items = [User]()
    
    static func findBy(id: Int) -> User? {
        for item in items {
            if item.id == id {
                return item
            }
        }
        
        return nil
    }
    
    static func findBy(name: String) -> User? {
        for item in items {
            if item.name == name {
                return item
            }
        }
        
        return nil
    }
    
    static func filterBy(name: String) -> [User] {
        return items.filter({$0.name == name})
    }
    
    static func add(user: User){
        items.append(user)
    }
    
}

