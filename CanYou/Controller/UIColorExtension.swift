//
//  UIColorExtension.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

// MARK: - UIColor extension
extension UIColor {
    static let defaultBackground = UIColor.init(red: 201.0/255.0, green: 218.0/255.0, blue: 90.0/255.0, alpha: 1.0)
    static let highlightBackground = UIColor.init(red: 235.0/255.0, green: 243.0/255.0, blue: 206.0/255.0, alpha: 1.0)
    static let customWhite = UIColor.init(red: 208.0/255.0, green: 255.0/255.0, blue: 179.0/255.0, alpha: 1.0)
    static let customRed = UIColor.init(red: 219.0/255.0, green: 65.0/255.0, blue: 43.0/255.0, alpha: 1.0)
    static let customYellow = UIColor.init(red: 242.0/255.0, green: 232.0/255.0, blue: 134.0/255.0, alpha: 1.0)
    static let gradationBackground = UIColor(patternImage: UIImage(named: "Gradation")!)
}
