//
//  HealthInfo.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then

class HealthInfo: Then {
    let id: Int
    var name: String = ""
    var image: UIImage?
    var time: Double = 0
    
    init(){
        HealthInfoStore.idCount += 1
        self.id = HealthInfoStore.idCount
    }
}

