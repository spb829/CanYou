//
//  RootContainerViewController.swift
//  CanYou
//
//  Created by Macbook Pro on 2017. 8. 14..
//  Copyright © 2017년 Eric Park. All rights reserved.
//

import UIKit
import Then

class RootContainerViewController: BaseViewController {
    // MARK : - Properties
    let scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
    }
    
    let pageControl = UIPageControl().then {
        $0.currentPage = 0
    }
    
    var cardViews = [PageContainerView]()
    var cardIndex: Int = 0
    
    let notificationController = NotificationController.shared
    
    private lazy var dashBoardViewController: DashBoardViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "DashBoard", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    private lazy var badgeViewController: BadgeViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Badge", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "BadgeViewController") as! BadgeViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    private lazy var rewardViewController: RewardViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Reward", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "RewardViewController") as! RewardViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        notificationController.updateNotifications()
    }
}


// MARK : - Init Views
extension RootContainerViewController {
    
    func initViews() {
        initCardViews()
        
        self.scrollView.delegate = self
        self.pageControl.numberOfPages = self.cardViews.count
        
        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.pageControl)
        
    }
    
    func initCardViews() {
        for i in 0...2 {
            let cardView = PageContainerView()
            
            switch i {
            case 0:
                let viewController = dashBoardViewController
                cardView.view.addSubview(viewController.view)
                viewController.view.frame = cardView.view.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                viewController.didMove(toParentViewController: self)
            case 1:
                let viewController = badgeViewController
                cardView.view.addSubview(viewController.view)
                viewController.view.frame = cardView.view.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                viewController.didMove(toParentViewController: self)
            case 2:
                let viewController = rewardViewController
                cardView.view.addSubview(viewController.view)
                viewController.view.frame = cardView.view.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                viewController.didMove(toParentViewController: self)
            default:
                break
            }
            
            self.cardViews.append(cardView)
            self.scrollView.addSubview(cardView)
        }
    }
    
    // Reload Data in TableViews
    func reloadData() {
        rewardViewController.tableView.reloadData()
        badgeViewController.tableView.reloadData()
        badgeViewController.updateRecentBadge()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let size = self.view.frame.size
        let barHeight = UIApplication.shared.statusBarFrame.height
        
        self.scrollView.frame = CGRect(x: 0, y: barHeight + 16, width: size.width, height: size.height - 16 - 80)
        self.pageControl.frame = CGRect(x: 0 , y: barHeight + 16 + size.height - 16 - 80, width: size.width, height: 20)
        
        updateCardLayout(cardIndex)
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
        reloadData()
    }
    
    // Present SettingTableView with Custom animation
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        // push view controller but animate modally
        let storyboard = UIStoryboard(name: "Setting", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        
        let navigationController = self.navigationController
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: vc, action: #selector(vc.closeButtonTapped(_:)))
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: vc, action: nil)
        
        let transition = AnimationController.popUpTransition
        
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(vc, animated: false)
    }
}

// MARK : - ScrollViewDelegate
extension RootContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let width = scrollView.frame.size.width
        
        if offsetX.truncatingRemainder(dividingBy: width) != 0 {
            return
        }
        
        var index = self.cardIndex
        
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

// Hide NavigationBar
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
