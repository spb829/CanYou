//
//  RewardNewViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 21..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardNewViewController: BaseViewController {
    // MARK : - Properties
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    
    @IBOutlet var stackViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleTextField.text = ""
        contentTextField.text = ""
        priceTextField.text = ""
        let navbarHeight = (self.navigationController?.navigationBar.intrinsicContentSize.height)!
        stackViewTopConstraint.constant = navbarHeight
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if checkText() {
           // save 작업 수행
            self.navigationController?.popViewController(animated: true)
        } else {
            // message 띄우기
            print("wrong input")
        }
    }

    func checkText() -> Bool {
        // 입력된 데이터 검사
        guard let title = titleTextField.text,
        let content = contentTextField.text,
            let price = priceTextField.text else {
                return false
        }
        
        let item = Reward().then {
            $0.name = title
            $0.content = content
            if let intPrice = Int(price){
                $0.price = intPrice
            }
            
        }
        
        RewardStore.addItem(item)
        
        return true
    }
    
}

