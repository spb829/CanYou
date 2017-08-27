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
    var healthInfoPercent: Int = 32
    
    private init() {
        
    }
    
    mutating func setHealthInfo(_ healthinfo: String){
        self.healthInfo = healthinfo
    }
    
    mutating func setPercent(_ percent: Int){
        if percent > 100 {
            self.healthInfoPercent = 100
        } else {
            self.healthInfoPercent = percent
        }
    }
    
    mutating func setDate(_ date: Date){
        self.startDate = date
    }
}
