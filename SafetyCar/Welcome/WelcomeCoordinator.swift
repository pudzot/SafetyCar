//
//  WelcomeCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 08/03/2023.
//

import UIKit

class WelcomeCoordinator: NewCoordinator {
    
    var onAuthenticated: (() -> ())?
    
    private lazy var viewController: UIViewController = {
        let presenter = WelcomePresenter(navigationDelegate: self)
        let viewController = WelcomeViewController(presenter: presenter)
        return viewController
    }()
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(viewController, hideBar: true)
    }
}

extension WelcomeCoordinator: WelcomePresenterNavigationDelegate {
    func didOpenDashboard() {
        onAuthenticated?()
    }
    
    
}
