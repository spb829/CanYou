//
//  MemoStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct MemoStore{
    static let sharedMemoStore = MemoStore()
    
    var idCount = 0
    var items = [Memo]()
    
    private init() { }
    
    func findBy(id: Int) -> Memo? {
        return items.filter({$0.id == id}).first
    }
    
    func findBy(name: String) -> Memo? {
        return items.filter({$0.name == name}).first
    }
    
    func filterBy(name: String) -> [Memo] {
        return items.filter({$0.name == name})
    }
    
}
