//
//  DataController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation

struct DataController {
    static let sharedDataController = DataController()
    let userStore = UserStore.sharedUserStore
    let badgeStore = BadgeStore.sharedBadgeStore
    let rewardStore = RewardStore.sharedRewardStore
    let healthInfoStore = HealthInfoStore.sharedHealthInfoStore
    

    private init() { }
    
    
}
