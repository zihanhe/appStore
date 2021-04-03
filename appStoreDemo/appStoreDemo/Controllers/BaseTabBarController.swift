//
//  BaseTabBarController.swift
//  appStoreDemo
//
//  Created by thunder on 27/03/21.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppSearchController(), title: NSLocalizedString("SEARCH", comment: ""), imageName: "magnifyingglass", tag: 2),

            createNavController(viewController: UIViewController(), title: NSLocalizedString("TODAY", comment: ""), imageName: "newspaper", tag: 0),
            createNavController(viewController: UIViewController(), title: NSLocalizedString("APPS", comment: ""), imageName: "square.stack.3d.up.fill", tag: 1),

        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController,
                                         title: String?,
                                         imageName: String?,
                                         tag: Int) -> UINavigationController {
        
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        viewController.navigationItem.largeTitleDisplayMode = .always

        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true

        navController.tabBarItem = UITabBarItem(title: title,
                                                image: UIImage(systemName: imageName ?? ""),
                                                tag: tag
        )
        
        return navController
    }
}


