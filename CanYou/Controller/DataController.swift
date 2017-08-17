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
    var userStore = UserStore.sharedUserStore
    var badgeStore = BadgeStore.sharedBadgeStore
    var rewardStore = RewardStore.sharedRewardStore
    var healthInfoStore = HealthInfoStore.sharedHealthInfoStore
    var currentUser: User?

    private init() { }
    
    @discardableResult mutating func signUp() -> User {
        self.currentUser = userStore.createUser()
        return self.currentUser!
    }
}
