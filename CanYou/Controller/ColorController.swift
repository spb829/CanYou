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
    
    var defaultBackgroundColor = UIColor.init(red: 201.0/255.0, green: 218.0/255.0, blue: 90.0/255.0, alpha: 1.0)
    var highlightBackgroundColor = UIColor.init(red: 235.0/255.0, green: 243.0/255.0, blue: 206.0/255.0, alpha: 1.0)
    var whiteColor = UIColor.init(red: 208.0/255.0, green: 255.0/255.0, blue: 179.0/255.0, alpha: 1.0)
    var redColor = UIColor.init(red: 219.0/255.0, green: 65.0/255.0, blue: 43.0/255.0, alpha: 1.0)
    var yellowColor = UIColor.init(red: 242.0/255.0, green: 232.0/255.0, blue: 134.0/255.0, alpha: 1.0)
    
    private init() { }
}

extension UIViewController {
    
    func applyColor() {
        let colorController = ColorController.shared
        
        if let view = self.view {
            view.layer.backgroundColor = colorController.defaultBackgroundColor.cgColor
        }
    }
    
    func applySubColor() {
        let colorController = ColorController.shared
        
        if let view = self.view {
            view.layer.backgroundColor = colorController.highlightBackgroundColor.cgColor
        }
    }
}
