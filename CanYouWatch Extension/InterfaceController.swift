//
//  InterfaceController.swift
//  CanYouWatch Extension
//
//  Created by Macbook Pro on 2017. 8. 17..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var stopTimer: WKInterfaceTimer!
    @IBOutlet var dayLabel: WKInterfaceLabel!
    
    var timer: Timer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
//        self.stopTimer.count
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
