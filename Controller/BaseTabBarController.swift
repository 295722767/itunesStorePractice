//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Mao Li on 4/6/19.
//  Copyright © 2019 MaoLi. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let todayController = UIViewController()
//        todayController.view.backgroundColor = .white
//        todayController.navigationItem.title = "Today"
//        let todayNavController = UINavigationController(rootViewController: todayController)
//        todayNavController.tabBarItem.title = "Today"
//        todayNavController.tabBarItem.image = UIImage(named: "today_icon")
//        todayNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search")
        ]

    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
