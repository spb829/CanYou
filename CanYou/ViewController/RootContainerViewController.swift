//
//  RootContainerViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 14..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then

class RootContainerViewController: UIViewController {
    let scrollView = UIScrollView().then {
        $0.backgroundColor = UIColor.brown
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    let pageControl = UIPageControl().then {
        $0.backgroundColor = UIColor.darkGray
        $0.currentPage = 0
    }
    
    var cardViews = [UILabel]()
    var cardIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    func initViews() {
        initCardViews()
        
        self.scrollView.delegate = self
        self.pageControl.numberOfPages = self.cardViews.count
        
        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.pageControl)
    }
    
    func initCardViews() {
        for i in 0...2 {
            let cardView = UILabel().then {
                $0.text = String(i)
                $0.textAlignment = .center
            }
            
            switch i {
            case 0:
                cardView.backgroundColor = UIColor.cyan
            case 1:
                cardView.backgroundColor = UIColor.red
            case 2:
                cardView.backgroundColor = UIColor.orange
            default:
                break
            }
            
            self.cardViews.append(cardView)
            self.scrollView.addSubview(cardView)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let size = self.view.frame.size
        
        let barHeight = UIApplication.shared.statusBarFrame.height
        
        self.scrollView.frame = CGRect(x: 0, y: barHeight + 16, width: size.width, height: size.height - 16 - 80)
        self.pageControl.frame = CGRect(x: 0 , y: barHeight + 16 + size.height - 16 - 80, width: size.width, height: 20)
        
        updateCardLayout(0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateCardLayout(_ index: Int) {
        self.cardIndex = index
        self.pageControl.currentPage = self.cardIndex
        
        let size = self.scrollView.frame.size
        
        switch self.cardIndex {
        case 0:
            cardViews[2].frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            cardViews[0].frame = CGRect(x: size.width, y: 0, width: size.width, height: size.height)
            cardViews[1].frame = CGRect(x: size.width * 2, y: 0, width: size.width, height: size.height)
        case 1:
            cardViews[0].frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            cardViews[1].frame = CGRect(x: size.width, y: 0, width: size.width, height: size.height)
            cardViews[2].frame = CGRect(x: size.width * 2, y: 0, width: size.width, height: size.height)
        case 2:
            cardViews[1].frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            cardViews[2].frame = CGRect(x: size.width, y: 0, width: size.width, height: size.height)
            cardViews[0].frame = CGRect(x: size.width * 2, y: 0, width: size.width, height: size.height)
        default:
            break
        }
        
        self.scrollView.contentOffset = CGPoint(x: size.width, y: 0)
        self.scrollView.contentSize = CGSize(width: size.width * 3, height: size.height)
    }
    
}

extension RootContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let width = scrollView.frame.size.width
        
        if offsetX.truncatingRemainder(dividingBy: width) != 0 {
            return
        }
        
        var index = self.cardIndex
        
        print("scroll \(offsetX)")
        
        switch offsetX {
        case 0:
            index -= 1
        case width * 2:
            index += 1
        default:
            break
        }
        
        if index < 0 {
            index = self.cardViews.count - 1
        } else if index > self.cardViews.count - 1 {
            index = 0
        }
        
        updateCardLayout(index)
    }
}

