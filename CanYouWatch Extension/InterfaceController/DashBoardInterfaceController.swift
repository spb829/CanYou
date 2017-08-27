//
//  DashBoardInterfaceController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 18..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class DashBoardInterfaceController: BaseInterfaceController {
    @IBOutlet var group: WKInterfaceGroup!
    @IBOutlet var contentLabel: WKInterfaceLabel!
    
    let duration = 1.2
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
//        self.group.setBackgroundImageNamed("percent0")
        self.menuRefresh()
    }
    
    @IBAction func menuRefresh(){
        if(WCSession.isSupported()){
            watchSession = WCSession.default
            watchSession.delegate = self
            watchSession.activate()
            watchSession.sendMessage(["request":"healthinfo"], replyHandler:{
//                print($0)
                if let healthinfo = $0["helthinfo"] as? String,
                    let percent = $0["percent"] as? Int {
                    self.dataController.setHealthInfo(healthinfo)
                    self.dataController.setPercent(percent)
//                    print("info: \(healthinfo), percent: \(percent)")
                }
            }, errorHandler: nil)
        }
        self.startAnimation()
    }
    
    func startAnimation() {
        self.contentLabel.setText(dataController.healthInfo)
        self.dataController.setPercent(dataController.healthInfoPercent)
//        self.group.setBackgroundImageNamed("percent")
        self.group.startAnimatingWithImages(in: NSMakeRange(0, dataController.healthInfoPercent), duration: self.duration, repeatCount: 1)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        self.group.setBackgroundImageNamed("percent0")
    }
    
}
