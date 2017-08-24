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
    var isPurchased: Bool = false
    
    init(){
        self.userId = 0
        RewardStore.idCount += 1
        self.id = RewardStore.idCount
    }
    
    init(userId: Int){
        self.userId = userId
        RewardStore.idCount += 1
        self.id = RewardStore.idCount
    }
    
    
}
