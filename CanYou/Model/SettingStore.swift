//
//  SettingStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct SettingStore{
    static let sharedSettingStore = SettingStore()
    
    var idCount = 0
    var items = [Setting]()
    
    private init() { }
    
    func findBy(id: Int) -> Setting? {
        return items.filter({$0.id == id}).first
    }
    
    func findBy(name: String) -> Setting? {
        return items.filter({$0.name == name}).first
    }
    
    func filterBy(name: String) -> [Setting] {
        return items.filter({$0.name == name})
    }
    
    func filterBy(userId: Int) -> [Setting] {
        return items.filter({$0.userId == userId})
    }
    
}
