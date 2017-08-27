//
//  StopWatchInterfaceController.swift
//  CanYouWatch Extension
//
//  Created by Macbook Pro on 2017. 8. 17..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class StopWatchInterfaceController: BaseInterfaceController {

    @IBOutlet var stopTimer: WKInterfaceTimer!
    @IBOutlet var dayLabel: WKInterfaceLabel!
    
    var timer: Timer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        dayLabel.setText("Please Refresh")
    }
    
    func startTimer() {
//        let device = WKInterfaceDevice.current()
//        device.play(.notification)
        
        dayLabel.setText("")
        
        self.stopTimer.setDate(dataController.startDate)
        self.stopTimer.start()
    }
    
    @IBAction func menuRefresh() {
        self.refreshDate()
        self.startTimer()
    }
    
    override func willActivate() {
        super.willActivate()
        self.menuRefresh()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func refreshDate() {
        if(WCSession.isSupported()){
            watchSession = WCSession.default
            watchSession.delegate = self
            watchSession.activate()
            watchSession.sendMessage(["request":"date"], replyHandler:{
                if let startDate = $0["date"] as? Date {
                    self.dataController.setDate(startDate)
                }
            }, errorHandler: nil)
        }
    }
}
