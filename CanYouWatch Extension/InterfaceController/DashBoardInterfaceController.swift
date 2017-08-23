//
//  DashBoardInterfaceController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 18..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import WatchKit
import Foundation


class DashBoardInterfaceController: WKInterfaceController {
    @IBOutlet var group: WKInterfaceGroup!
    let duration = 5.0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        group.setBackgroundImageNamed("percent")
        group.startAnimatingWithImages(in: NSMakeRange(0, 100), duration: self.duration, repeatCount: 30)
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
