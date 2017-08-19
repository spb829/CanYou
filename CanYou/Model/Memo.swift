//
//  Memo.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit
import Then

class Memo: Then {
    let id: Int
    let userId: Int
    var name: String?
    var image: UIImage?
    var content: String?
    
    init(userId: Int){
        self.id = 1
        self.userId = userId
    }
    
    
}
