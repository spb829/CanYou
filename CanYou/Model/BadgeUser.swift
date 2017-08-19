//
//  BadgeUser.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit
import Then

class BadgeUser: Then {
    let id: Int
    let userId: Int
    let badgeId: Int
    
    var date: Date?
    
    init(badgeId: Int, userId: Int){
        self.id = 1
        self.userId = userId
        self.badgeId = badgeId
    }
    
    
}
