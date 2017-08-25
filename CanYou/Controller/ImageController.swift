//
//  ImageController.swift
//  CanYou
//
//  Created by Mac Pro on 2017. 8. 25..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class ImageController {
    static func convertToData(fromImage originImage: UIImage?) -> Data? {
        guard let image = originImage,
            let data = UIImageJPEGRepresentation(image, 0.9),
            let imgPNG = UIImage(data: data),
            let dataPNGImg = UIImagePNGRepresentation(imgPNG)
            else {
                // Failed
                return nil
        }
        
        return dataPNGImg
    }
    
    static func convertToImage(fromData originData: Data?) -> UIImage? {
        guard let data = originData else {
                return UIImage(named: "noimage")
        }
        
        return UIImage(data: data)
    }
    
    static func convertToImage(fromName originName: String) -> UIImage? {
        guard let image = UIImage(named: originName) else {
            return UIImage(named: "noimage")
        }
        
        return image
    }
    
    static func loadImageFromPath(_ path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            return UIImage(named: "noimage")
        } else{
            return image
        }
    }
    
    static func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        //print("Path: \(documentsDirectory)")
        return documentsDirectory as NSString
    }
}
