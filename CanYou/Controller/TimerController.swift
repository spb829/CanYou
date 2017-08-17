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
    
//    var timeElapsedInt: Int {
//        return Int(timeElapsed)
//    }
    
//    var day2: UInt8 {
//
//    }
    
    var day2: UInt32 {
        return UInt32((timeElapsed / 86400.0))
    }
    
    var hours2: UInt16 {
        return UInt16((timeElapsed / 3600.0).truncatingRemainder(dividingBy: 24))
    }
    
    var minutes2: UInt8 {
        return UInt8((timeElapsed / 60.0).truncatingRemainder(dividingBy: 60))
    }
    
    var seconds2: UInt8 {
        return UInt8(timeElapsed.truncatingRemainder(dividingBy: 60))
    }
    
    var elapsedTimeDate: Date {
        return Date(timeIntervalSinceReferenceDate: timeElapsed)
    }
    
    var day: Double {
        return (timeElapsed / 3600) / 24
    }
    
//    var strDay: String {
//        return String((timeElapsed / 3600) / 24)
//    }
    
    var hours: Double {
        return (timeElapsed / 3600).truncatingRemainder(dividingBy: 24)
    }
    
//    var strHours: String {
//        return String((timeElapsed / 3600).truncatingRemainder(dividingBy: 24))
//    }
    
    var minutes: Double {
        return (timeElapsed / 60).truncatingRemainder(dividingBy: 60)
    }
    
//    var strMinutes: String {
//        return String()
//    }
    
    var seconds: Double {
        return timeElapsed.truncatingRemainder(dividingBy: 60)
    }
    
//    var strSeconds: String {
//        return String()
//    }
    
//    var strHours: String {
//        return String(format: "%02d", UInt8(elapsedTime / 3600.0))
//    }
//
//    var strMinutes: String {
//        return String(format: "%02d", UInt8(elapsedTime / 60.0))
//    }
//
//    var strSeconds: String {
//        return String(format: "%02d", UInt8(elapsedTime - UInt8(elapsedTime / 60.0) * 60))
//    }
    
    
    private init() { }
    
    
}

