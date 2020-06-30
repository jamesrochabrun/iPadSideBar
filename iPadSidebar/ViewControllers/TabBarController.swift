//
//  TabBarController.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

// MARK:- TabBarController
final class TabBarController: UITabBarController {
    /// 1 - Set view Controllers using `TabsViewModel`
    /// 2 - This iteration will create a master view controller embedded in a navigation controller for each tab.
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = TabsViewModel.allCases.map {
            let rootNavigationController = UINavigationController(rootViewController: $0.primaryViewController)
            rootNavigationController.tabBarItem.image = $0.icon
            return rootNavigationController
        }
    }
}
