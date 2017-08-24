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
    static let sharedUserStore = UserStore()
    var idCount = 0
    var items = [User]()
    
    private init() { }
    
    func findBy(id: Int) -> User? {
        return items.filter({$0.id == id}).first
    }
    
    func findBy(name: String) -> User? {
        return items.filter({$0.name == name}).first
    }
    
    func filterBy(name: String) -> [User] {
        return items.filter({$0.name == name})
    }
    
    @discardableResult mutating func createUser() -> User{
        let user = User()
        
        items.append(user)
        return user
    }
    
    
}

