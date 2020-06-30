//
//  TabsViewModel.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

// Abstract of a set of tabs in an app.

// MARK:- ViewModel
enum TabsViewModel: String, CaseIterable {
    
    case home
    case search
    case camera
    case notifications
    case profile
    
    /// Return:- the tab bar icon using SF Symbols
    var icon: UIImage? {
        switch self {
        case .home: return UIImage(systemName: "house.fill")
        case .search: return UIImage(systemName: "magnifyingglass")
        case .camera: return UIImage(systemName: "plus.app")
        case .notifications: return UIImage(systemName: "suit.heart")
        case .profile: return UIImage(systemName: "person")
        }
    }
    /// Return:- the tab bar title
    var title: String { rawValue }
    
    /// Return:-  the master/primary `topViewController`,  it instantiates a view controller using a convenient method for `UIStoryboards`.
    var primaryViewController: UIViewController  {
        switch self {
        case .home: return HomeViewController()
        case .search: return SearchViewController()
        case .camera: return CameraViewController()
        case .notifications: return NotificationsViewController()
        case .profile: return UserProfileViewController()
        }
    }
}

class SupplementaryViewController: BaseViewController {}
class SecondaryViewController: BaseViewController {}

class HomeViewController: BaseViewController {}
class SearchViewController: BaseViewController {}
class CameraViewController: BaseViewController {}
class NotificationsViewController: BaseViewController {}
class UserProfileViewController: BaseViewController {}

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.random
    }
}
