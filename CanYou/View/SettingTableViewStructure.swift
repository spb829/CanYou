//
//  SettingTableViewStructure.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 17..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then

enum CellType {
    case `switch`
    case basic
    
    // Reuseidenifier를 사용
    var rawValue: String {
        switch self {
        case .switch: return "SettingSwitchTableViewCell"
        case .basic: return "SettingBasicTableViewCell"
        }
    }
}

class CellInfo: Then {
    var title: String = ""
    var content: String = ""
    var type: CellType = .basic
    var isOff: Bool = true
    var isOn: Bool {
        get {
            return !isOff
        }
        set(bool){
            self.isOff = !bool
        }
    }
    var name: String = ""
}
class SectionInfo: Then {
    var title: String?
    var color: UIColor?
    var cells: [CellInfo] = [CellInfo]()
}

// 설정 테이블뷰의 구조 정보를 담고 있는 구조체
struct SettingTableViewStructure {
//    var currentUser: User = DataController.sharedDataController.currentUser!
    
    var numberOfSections: Int {
        return Int(sections.count)
    }
    var sections: [SectionInfo] = [SectionInfo]()
    
    init() {
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"
        //        dateFormatter.locale = Locale.init(identifier: "en_GB")
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        
        // 첫 번째 섹션
        self.sections.append(SectionInfo().then {
            $0.title = "사용자 정보"
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "이름"
//                $0.content = currentUser.name
                $0.content = "박현민"
                $0.name = "name"
            })
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "성별"
//                $0.content = currentUser.gender
                $0.content = "남자"
                $0.name = "gender"
            })
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "생년월일"
//                $0.content = dateFormatter.string(from: currentUser.birth)
                $0.name = "birth"
            })
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "금연 시작일"
//                $0.content = dateFormatter.string(from: currentUser.startDate)
                $0.name = "startDate"
            })
        })
        
        // 두 번째 섹션
        self.sections.append(SectionInfo().then {
            $0.title = "개인 설정"
            
            $0.cells.append(CellInfo().then {
                $0.type = .switch
                $0.title = "랜덤알람설정"
                $0.name = "randomAlarm"
            })
            
            $0.cells.append(CellInfo().then {
                $0.type = .switch
                $0.title = "암호 잠금"
                $0.name = "enablePassword"
            })
        })
        
        // 세 번째 섹션
        self.sections.append(SectionInfo().then {
            $0.title = "고객 지원"
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "버전정보"
                $0.content = "v1.0.0"
                $0.name = "version"
            })
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "리뷰 작성"
                $0.name = "composeReview"
            })
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "문의 및 의견"
                $0.name = "emailToMe"
            })
            
            $0.cells.append(CellInfo().then {
                $0.type = .basic
                $0.title = "사용기록 초기화"
                $0.name = "clearData"
            })
        })
    }
    
    func numberOfRows(_ section: Int) -> Int{
        return self.sections[section].cells.count
    }
}
