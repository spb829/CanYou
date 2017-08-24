//
//  PageContainerView.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 14..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class PageContainerView: UIView {
    var view = UIView().then {
        $0.layer.cornerRadius = 10
//        $0.layer.borderWidth = 1
//        $0.layer.borderColor = UIColor.black.cgColor
        $0.backgroundColor = UIColor.white
        $0.clipsToBounds = true
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        
        let margin: CGFloat = 16
        let viewWidth = width - margin * 2
        let viewHeight = height - margin * 2
        
        self.view.frame = CGRect(x: margin, y: margin, width: viewWidth, height: viewHeight)
        
    }
    
}
