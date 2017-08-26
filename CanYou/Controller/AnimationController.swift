//
//  AnimationController.swift
//  CanYou
//
//  Created by Mac Pro on 2017. 8. 25..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then

struct AnimationController: Then {
    static var popUpTransition: CATransition {
        return CATransition().then{
            $0.duration = 0.5
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            $0.type = kCATransitionMoveIn
            $0.subtype = kCATransitionFromTop
        }
    }
    static var popDownTransition: CATransition {
        return CATransition().then{
            $0.duration = 0.5
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            $0.type = kCATransitionReveal
            $0.subtype = kCATransitionFromBottom
        }
    }
    
    static func fadeTransition(_ view: UIView, for duration:CFTimeInterval) {
        let animation = CATransition().then {
            $0.timingFunction = CAMediaTimingFunction(name:
                kCAMediaTimingFunctionEaseInEaseOut)
            $0.type = kCATransitionFade
            $0.duration = duration
        }
        view.layer.add(animation, forKey: kCATransitionFade)
    }
}
