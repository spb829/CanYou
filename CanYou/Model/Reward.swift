//
//  Reward.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit
import Then

class Reward: Then {
    let id: Int
    let userId: Int
    
    var name: String?
    var image: UIImage?
    var content: String?
    
    var price: Int?
    var purchased: Bool
    
    init(){
        self.userId = 0
        self.id = 1
        self.purchased = false
    }
    
    init(userId: Int){
        self.id = 1
        self.userId = userId
        self.purchased = false
    }
    
    
}
