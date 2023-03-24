//
//  TabBarCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 11/03/2023.
//

import UIKit

class TabBarCoordinator: NewCoordinator {
    
    private let tabBarController = TabBarController()
    
    private var tabs: [UIViewController: NewCoordinator] = [:]
    
    private let store: StoreType
    
    init(router: RouterType, store: StoreType) {
        self.store = store
        super.init(router: router)
        router.setRootModule(tabBarController, hideBar: true)
        
        setTabs([getCar()])
    }
    
    func setTabs(_ coordinators: [NewCoordinator], animated: Bool = false) {
        tabs = [:]

        let vcs = coordinators.map { coordinator -> UIViewController in
            let viewController = coordinator.toPresentable()
            self.addChild(coordinator)
            tabs[viewController] = coordinator
            return viewController
        }
        
        tabBarController.setViewControllers(vcs, animated: animated)
    }
    
    func getCar() -> NewCoordinator {
        let navigationController = NavigationController()
        let tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        navigationController.tabBarItem = tabBarItem
        let router = Router(navigationController: navigationController)
        let coordinator = CarCurrentCoordinator(router: router)
        //coordinator.router.setNavigationBarHidden(isHidden: true)
        
        return coordinator
    }
    
    
}
