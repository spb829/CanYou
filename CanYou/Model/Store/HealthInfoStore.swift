//
//  HealthInfoStore.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import RealmSwift

struct HealthInfoStore{
    static var items: [HealthInfo] = DataController.shared.healthInfos
    
}
