//
//  User.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 12..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let id: Int
    var name: String = ""
    var birth: Date = Date()
    var gender: String = "남"
    var startDate: Date = Date()
    
    var cigaretteDaily: Int = 1
    var cigarettePrice: Int = 4500
    var canValue: Int = 0
    
    init(){
        self.id = 0
    }
    
    
}
