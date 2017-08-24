//
//  RewardNewViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 21..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class RewardNewViewController: BaseViewController {
    @IBOutlet var rewardImageView: UIImageView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    
    var rewardStore = DataController.sharedDataController.rewardStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            $0.price = Int(price)
            
            if let image = self.rewardImageView.image {
                $0.image = image
            }
        }
        
        rewardStore.add(item)
        
        return true
    }
    
    @IBAction func addImage(_ sender: UITapGestureRecognizer) {
        print("addImage")
        
        titleTextField.resignFirstResponder()
        contentTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let chooseCameraAction = UIAlertAction(title: "Take Photo", style: .default, handler: nil)
        
        sheet.addAction(chooseCameraAction)
        
        let chooseAlbumAction = UIAlertAction(title: "Select Photo From Library", style: .default, handler: { (alertAction) -> Void in
            let imagePicker = UIImagePickerController()
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                imagePicker.sourceType = .photoLibrary
            }
            
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        sheet.addAction(chooseAlbumAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        sheet.addAction(cancelAction)
        
        present(sheet, animated: true, completion: nil)
    }
}

extension RewardNewViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK : UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            self.rewardImageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
