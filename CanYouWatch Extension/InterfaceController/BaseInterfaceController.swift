//
//  BaseInterfaceController.swift
//  CanYouWatch Extension
//
//  Created by Mac Pro on 2017. 8. 27..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class BaseInterfaceController: WKInterfaceController, WCSessionDelegate {
    var dataController = DataController.shared
    var watchSession : WCSession!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // do nothing here!
    }
}
