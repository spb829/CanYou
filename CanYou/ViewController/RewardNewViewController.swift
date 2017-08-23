//
//  RewardNewViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 21..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardNewViewController: UIViewController {
    @IBOutlet var rewardImageView: UIImageView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    
    var rewardStore = DataController.sharedDataController.rewardStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        applyColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        rewardImageView.image = UIImage(named: "noimage")
        titleTextField.text = ""
        contentTextField.text = ""
        priceTextField.text = ""
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if checkText() {
           
           // save 작업 수행
            self.navigationController?.popViewController(animated: true)
        } else {
            // message 띄우기
            print("잘못된 입력")
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
            $0.price = Int(price)
        }
        
        rewardStore.add(item)
        
        return true
    }

}
