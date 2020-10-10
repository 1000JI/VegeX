//
//  ViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/7/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        DispatchQueue.main.async {
            let launchView = LaunchViewController()
            launchView.modalPresentationStyle = .fullScreen
            self.present(launchView, animated: false)
        }
        
    }
    
    // MARK: - Helpers
    
    func configureTabBar() {
        let homeViewController = HomeViewController()
        let naviHome = UINavigationController(rootViewController: homeViewController)
        naviHome.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(named: "home"),
            selectedImage: nil)
        
        let storeController = StoreHomeViewController()
        let naviStore = UINavigationController(rootViewController: storeController)
        naviStore.tabBarItem = UITabBarItem(
            title: "스토어",
            image: UIImage(named: "store"),
            selectedImage: nil)
        
        let myPageController = MyPageViewController()
        let naviMyPage = UINavigationController(rootViewController: myPageController)
        naviMyPage.tabBarItem = UITabBarItem(
            title: "마이페이지",
            image: UIImage(named: "mypage"),
            selectedImage: nil)
        
        viewControllers = [naviHome, naviStore, naviMyPage]
        viewControllers?.forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .white
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(rgb: 0x71A08A)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x71A08A)
            ]
            
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(rgb: 0x303033)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x303033)
            ]
            
            tabBar.isTranslucent = false
            tabBar.standardAppearance = appearance
        }
    }
    
}

