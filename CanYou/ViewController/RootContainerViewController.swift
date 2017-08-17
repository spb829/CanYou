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
        $0.backgroundColor = UIColor.clear
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    let pageControl = UIPageControl().then {
        $0.backgroundColor = UIColor.clear
        $0.currentPage = 0
    }
    
    var cardViews = [PageContainerView]()
    var cardIndex: Int = 0
    
    private lazy var dashBoardViewController: DashBoardViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    private lazy var badgeViewController: BadgeViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "BadgeViewController") as! BadgeViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    private lazy var rewardViewController: RewardViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "RewardViewController") as! RewardViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        print("viewDidLoad")
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
            let cardView = PageContainerView().then {
                $0.backgroundColor = UIColor(red: 255, green: 180, blue: 0, alpha: 1.0)
            }
            
            switch i {
            case 0:
                let viewController = dashBoardViewController
                cardView.view.addSubview(viewController.view)
                viewController.view.frame = cardView.view.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                viewController.didMove(toParentViewController: self)
//                cardView.backgroundColor = UIColor.cyan
            case 1:
                let viewController = badgeViewController
                cardView.view.addSubview(viewController.view)
                viewController.view.frame = cardView.view.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                viewController.didMove(toParentViewController: self)
//                cardView.backgroundColor = UIColor.red
            case 2:
                let viewController = rewardViewController
                cardView.view.addSubview(viewController.view)
                viewController.view.frame = cardView.view.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                viewController.didMove(toParentViewController: self)
//                cardView.backgroundColor = UIColor.orange
            default:
                break
            }
            
            self.cardViews.append(cardView)
            self.scrollView.addSubview(cardView)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("viewWillLayoutSubviews")
        
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
            cardViews[2].updateFrame(x: 0, y: 0, width: size.width, height: size.height)
            cardViews[0].updateFrame(x: size.width, y: 0, width: size.width, height: size.height)
            cardViews[1].updateFrame(x: size.width * 2, y: 0, width: size.width, height: size.height)
        case 1:
            cardViews[0].updateFrame(x: 0, y: 0, width: size.width, height: size.height)
            cardViews[1].updateFrame(x: size.width, y: 0, width: size.width, height: size.height)
            cardViews[2].updateFrame(x: size.width * 2, y: 0, width: size.width, height: size.height)
        case 2:
            cardViews[1].updateFrame(x: 0, y: 0, width: size.width, height: size.height)
            cardViews[2].updateFrame(x: size.width, y: 0, width: size.width, height: size.height)
            cardViews[0].updateFrame(x: size.width * 2, y: 0, width: size.width, height: size.height)
        default:
            break
        }
        
        self.scrollView.contentOffset = CGPoint(x: size.width, y: 0)
        self.scrollView.contentSize = CGSize(width: size.width * 3, height: size.height)
    }
    
}

// 스크롤뷰 딜리게이트
extension RootContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let width = scrollView.frame.size.width
        
        if offsetX.truncatingRemainder(dividingBy: width) != 0 {
            return
        }
        
        var index = self.cardIndex
        
//        print("scroll \(offsetX)")
        
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

// 네비게이션 바 숨기기
extension RootContainerViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navigationController = self.navigationController {
            // Hide the navigation bar on the this view controller
            navigationController.setNavigationBarHidden(true, animated: animated)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let navigationController = self.navigationController {
            // Show the navigation bar on other view controllers
            navigationController.setNavigationBarHidden(false, animated: animated)
        }
    }
}

