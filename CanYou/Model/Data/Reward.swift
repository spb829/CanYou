//
//  Reward.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import RealmSwift

class Reward: RealmSwift.Object {
    // PrimaryKey
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var userId: Int = 0
    
    // Properties
    @objc dynamic var name: String = ""
    @objc dynamic var imageData: Data? = Data()
    var image: UIImage? {
        get {
            return ImageController.convertToImage(fromData: imageData)
        }
        set (originImage) {
            imageData = ImageController.convertToData(fromImage: originImage)
        }
    }
    @objc dynamic var content: String = ""
    
    @objc dynamic var price: Int = 0
    @objc dynamic var isPurchased: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
