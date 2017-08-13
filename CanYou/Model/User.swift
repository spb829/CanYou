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
    var name: String?
    var birth: Date?
    var gender: String?
    var startDate: Date?
    
    var cigaretteDaily: Int?
    var cigarettePrice: Int?
    var canValue: Int?
    
    init(){
        self.id = 1
    }
    
    
}
