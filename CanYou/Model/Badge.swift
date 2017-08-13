//
//  Badge.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

enum ConditionType {
    case time
    case cigarette
    case money
}

struct Badge {
    let id: Int
    var name: String?
    var image: UIImage?
    var content: String?
    var conditionType: ConditionType?
    var conditionValue: Int?
    
    
    init(){
        self.id = 1
    }
    
    
}
