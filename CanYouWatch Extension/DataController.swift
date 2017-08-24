//
//  DataController.swift
//  CanYouWatch Extension
//
//  Created by Macbook Pro on 2017. 8. 24..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import WatchKit

struct DataController {
    static let shared = DataController()
    
    var startDate = Date()
    var healthInfo = ""
    
    private init() {
        
    }
}
