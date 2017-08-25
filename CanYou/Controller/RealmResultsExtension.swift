//
//  RealmResultsExtension.swift
//  CanYou
//
//  Created by Mac Pro on 2017. 8. 25..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    
    // MARK: - Realm's Results extension
    func toArray() -> [T] {
        var array = [T]()
        for result in self {
            array.append(result)
        }
        return array
    }
}

extension List {
    // MARK: - List extension toArray
    func toArray() -> [T] {
        var array = [T]()
        for e in self {
            array.append(e)
        }
        return array
    }
}
