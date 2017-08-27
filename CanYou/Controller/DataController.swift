//
//  DataController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 13..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import Foundation
import RealmSwift

struct DataController {
    static let shared = DataController()
    static let realm = try! Realm()
    
    let version = "v1.0.0"
    let dateFormatter = DateFormatter().then {
        $0.dateFormat = "yyyy. MM. dd"
    }
    
    var currentUser: User
    
    var rewards: [Reward] {
        return try! Realm().objects(Reward.self).toArray()
    }
    var toDoRewards: [Reward] {
        return self.rewards.filter({$0.isDone == false})
    }
    var doneRewards: [Reward] {
        return self.rewards.filter({$0.isDone == true})
    }
    
    var healthInfos: [HealthInfo] {
        return try! Realm().objects(HealthInfo.self).toArray()
    }
    var badges: [Badge] {
        return currentUser.badges.toArray()
    }
    var toDoBadges: [Badge] {
        return self.badges.filter({$0.isDone == false})
    }
    var doneBadges: [Badge] {
        return self.badges.filter({$0.isDone == true})
    }
    
    var timeInterval: TimeInterval {
        return Date().timeIntervalSince(currentUser.startDate)
    }
    
    var lastHealthInfo: HealthInfo {
        for e in healthInfos {
            if e.time > timeInterval {
                return e
            }
        }
        return HealthInfo()
    }

    private init() {
        currentUser = UserStore.currentUser()!
    }
    
    func initAll() {
        initBadges()
        initHealthInfos()
    }
    
    func initBadges() {
        if currentUser.badges.count > 5 {
            return
        }
//        BadgeStore.createItem(user: currentUser, name: "24hours", imageName: "badge-24hours", content: "Good start !1", conditionType: .time, conditionValue: 10)
//        BadgeStore.createItem(user: currentUser, name: "24hours", imageName: "badge-24hours", content: "Good start !2", conditionType: .time, conditionValue: 20)
//        BadgeStore.createItem(user: currentUser, name: "24hours", imageName: "badge-24hours", content: "Good start !3", conditionType: .time, conditionValue: 30)
        BadgeStore.createItem(user: currentUser, name: "24hours", imageName: "badge-24hours", content: "Good start !", conditionType: .time, conditionValue: 86400)
        BadgeStore.createItem(user: currentUser, name: "48hours", imageName: "badge-48hours", content: "Nice", conditionType: .time, conditionValue: 172800)
        BadgeStore.createItem(user: currentUser, name: "72hours", imageName: "badge-72hours", content: "Keep it up !", conditionType: .time, conditionValue: 259200)
        BadgeStore.createItem(user: currentUser, name: "A Week", imageName: "badge-7days", content: "Getting better", conditionType: .time, conditionValue: 604800)
        BadgeStore.createItem(user: currentUser, name: "Money saved", imageName: "badge-10000won", content: "10,000 won saved!", conditionType: .money, conditionValue: 10000)
        BadgeStore.createItem(user: currentUser, name: "Money saved", imageName: "badge-moneysave", content: "100,000 won saved!", conditionType: .money, conditionValue: 100000)
        BadgeStore.createItem(user: currentUser, name: "First reward", imageName: "badge-1reward", content: "You got a reward", conditionType: .reward, conditionValue: 1)
    }
    
    func initHealthInfos() {
        if healthInfos.count > 5 {
            return
        }

        HealthInfoStore.createItem(name: "혈압, 맥박, 손과 발의 체온이 정상으로 돌아옴", time: 1200, content: "20분")
        HealthInfoStore.createItem(name: "혈중 니코틴 농도가 낮아지기 시작함", time: 7200, content: "2시간")
        HealthInfoStore.createItem(name: "혈중 니코틴 수치가 6.2%로 거의 사라짐", time: 28800, content: "8시간")
        HealthInfoStore.createItem(name: "혈중 산소량과 일산화 탄소양이 정상으로 돌아옴", time: 43200, content: "12시간")
        HealthInfoStore.createItem(name: "일산화 탄소가 배출됨", time: 64800, content: "18시간")
        HealthInfoStore.createItem(name: "후각과 미각이 정상으로 돌아오기 시작", time: 172800, content: "48시간")
        HealthInfoStore.createItem(name: "니코틴이 완전히 사라짐, 폐 기능 향상", time: 259200, content: "72시간")
        HealthInfoStore.createItem(name: "진하던 가래가 묽어짐", time: 604800, content: "1주")
        HealthInfoStore.createItem(name: "중독 증세가 괴롭지 않은 지점에 도달", time: 1209600, content: "2주")
        HealthInfoStore.createItem(name: "니코틴 수용체 감소로 비흡연자와 비슷한 수준에 도달", time: 1814400, content: "3주")
        HealthInfoStore.createItem(name: "금단 현상 종료, 인슐린 저항성이 정상으로 돌아옴", time: 2592000, content: "1달")
        HealthInfoStore.createItem(name: "혈액순환이 좋아지고 폐 기능이 30% 향상", time: 5184000, content: "2달")
        HealthInfoStore.createItem(name: "순환기능 향상, 심장마비가 올 확률 감소", time: 7776000, content: "3달")
        HealthInfoStore.createItem(name: "폐의 섬모가 다시 자라남, 전체적인 체력 증가", time: 23328000, content: "9달")
        HealthInfoStore.createItem(name: "심혈관계통 질환이 비흡연자의 절반으로 감소", time: 31536000, content: "1년")
        HealthInfoStore.createItem(name: "흡연으로 폐에 쌓였던 가래가 완전히 제거됨", time: 63072000, content: "2년")
        HealthInfoStore.createItem(name: "뇌졸증에 걸릴 위험이 비흡연자와 같아짐", time: 157680000, content: "5년")
        HealthInfoStore.createItem(name: "흡연 관련 암 발병율이 흡연자의 절반으로 감소됨", time: 315360000, content: "10년")
        HealthInfoStore.createItem(name: "심혈관계통 질환에 걸릴 위험이 비흡연자와 같아짐", time: 473040000, content: "15년")
        
    }
}
