//
//  TimerController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 17..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation

struct TimerController {
    static let sharedTimerController = TimerController()
    var timer: Timer = Timer()
    
    var start = Date()
    var startTime = TimeInterval()
    
    var timeElapsed: TimeInterval {
        return Date().timeIntervalSince1970 - start.timeIntervalSince1970
    }
    
    var day: UInt32 {
        return UInt32((timeElapsed / 86400.0))
    }
    
    var hours: UInt16 {
        return UInt16((timeElapsed / 3600.0).truncatingRemainder(dividingBy: 24))
    }
    
    var minutes: UInt8 {
        return UInt8((timeElapsed / 60.0).truncatingRemainder(dividingBy: 60))
    }
    
    var seconds: UInt8 {
        return UInt8(timeElapsed.truncatingRemainder(dividingBy: 60))
    }
    
    var elapsedTimeDate: Date {
        return Date(timeIntervalSinceReferenceDate: timeElapsed)
    }
    
    private init() { }
    
    
}

