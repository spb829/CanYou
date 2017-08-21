//
//  ColorController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 21..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import UIKit

struct ColorController {
    static let shared = ColorController()
    
    var defaultBackgroundColor = UIColor.init(red: 201, green: 218, blue: 90, alpha: 1.0)
    var highlightBackgroundColor = UIColor.init(red: 235, green: 243, blue: 206, alpha: 1.0)
    var whiteColor = UIColor.init(red: 208, green: 255, blue: 179, alpha: 1.0)
    var redColor = UIColor.init(red: 219, green: 65, blue: 43, alpha: 1.0)
    var yellowColor = UIColor.init(red: 242, green: 232, blue: 134, alpha: 1.0)
    
    private init() { }
    
}

extension UIViewController {
    func applyColor() {
        let colorController = ColorController.shared
        
        if let view = self.view {
            view.layer.backgroundColor = colorController.defaultBackgroundColor.cgColor
        }
    }
}
