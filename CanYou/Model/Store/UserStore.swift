//
//  UserStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

struct UserStore{
    static let realm = try! Realm()
    
    static func initUser() {
        try! realm.write {
            let user = User()
            realm.add(user)
        }
    }
    
    static func currentUser() -> User? {
        guard let user = realm.objects(User.self).first else {
            initUser()
            return realm.objects(User.self).first
        }
        
        return user
    }
}

