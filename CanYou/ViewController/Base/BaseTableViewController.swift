//
//  BaseTableViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 23..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    var overlayView: UIView?
    var activityIndicator: UIActivityIndicatorView?
    
    func addBackgroundView() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "Gradation2")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("BaseViewController viewWillDisappear")
        
        stopLoading()
    }
    
    func startLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        overlayView = UIView(frame: view.frame)
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        
        guard let overlayView = self.overlayView, let indicator = self.activityIndicator else { return }
        
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = CGPoint(x: (overlayView.bounds.width)/2, y: (overlayView.bounds.height)/2)
        
        overlayView.addSubview(indicator)
        indicator.startAnimating()
        
        view.addSubview(overlayView)
    }
    
    func stopLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        guard let overlayView = self.overlayView, let indicator = self.activityIndicator else { return }
        
        UIView.animate(withDuration: 0.2, animations: {
            overlayView.alpha = 0
        }) { (_) in
            indicator.stopAnimating()
            indicator.removeFromSuperview()
            overlayView.removeFromSuperview()
        }
    }
    
    func changeBgColorBasedOnTime() {
        
        let date = Date()
        let currentHour = Calendar.current.component(.hour, from: date)
        if currentHour > 19 || currentHour < 6 { //Night
            
        } else if currentHour >= 6 && currentHour < 16{
            
        } else if currentHour >= 16 && currentHour <= 19 {
            
        } else {
            
        }
        
    }
}
