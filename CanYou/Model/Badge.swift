//
//  Badge.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then

enum ConditionType {
    case time
    case cigarette
    case money
}

class Badge: Then {    
    let id: Int
    var name: String?
    var image: UIImage?
    var content: String?
    var conditionType: ConditionType?
    var conditionValue: Int?
    
    
    init(){
        BadgeStore.idCount += 1
        self.id = BadgeStore.idCount
    }
    
    
}
