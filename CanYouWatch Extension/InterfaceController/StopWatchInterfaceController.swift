//
//  StopWatchInterfaceController.swift
//  CanYouWatch Extension
//
//  Created by Macbook Pro on 2017. 8. 17..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import WatchKit
import Foundation


class StopWatchInterfaceController: WKInterfaceController {

    @IBOutlet var stopTimer: WKInterfaceTimer!
    @IBOutlet var dayLabel: WKInterfaceLabel!
    
    var timer: Timer!
    var start = Date()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
//        self.stopTimer.count
        dayLabel.setText("금연을 시작하세요!")
    }
    
    func startTimer() {
        let device = WKInterfaceDevice.current()
        device.play(.notification)
        
        dayLabel.setText("0 일")
        
        start = Date()
        
        self.stopTimer.setDate(start)
        self.stopTimer.start()
    }
    
    @IBAction func menuStart() {
        self.startTimer()
    }
    
    @IBAction func menuStop() {
        stopTimer.stop()
        if let timer = self.timer {
            timer.invalidate()
        }
        dayLabel.setText("금연을 시작하세요!")
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
