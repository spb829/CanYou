//
//  User.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 12..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit
import Then

class User: Then {
    let id: Int = 0
    var name: String = ""
    var birth: Date = Date()
    var gender: String = "Male"
    var startDate: Date = Date()
    
    var cigaretteDaily: Int = 20
    var cigarettePrice: Int = 4500
    var canValue: Int = 0
    
    var randomAlarm: Bool = false
    
    init(){ }
    
}
