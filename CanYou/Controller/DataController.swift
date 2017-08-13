//
//  DataController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation

struct DataController {
    //    static let userStore: UserStore
    
    static func add(user: User) {
        UserStore.add(user: user)
    }
    
}
