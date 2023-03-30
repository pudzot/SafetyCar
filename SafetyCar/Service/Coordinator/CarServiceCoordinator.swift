//
//  CarServiceCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 14/03/2023.
//

import UIKit

final class CarServiceCoordinator: NewCoordinator {
    
    var car: Car
    
    init(car: Car, router: RouterType) {
        self.car = car
        super.init(router: router)
    }
    
    private lazy var viewController: UIViewController = {
        let presenter = CarServicePresenter(car: car, navigationDelegate: self)
        return CarServiceViewController(presenter: presenter)
    }()
    
    public override func toPresentable() -> UIViewController {
        return viewController
    }
}

extension CarServiceCoordinator: CarServiceNavigationDelegate {
    
    func openAddService(with car: Car) {
        
        let navigationController = NavigationController()
        let router = Router(navigationController: navigationController)
        let coordinator = AddServiceCoordinator(car: car, router: router)
        
        addChild(coordinator)
        self.router.present(coordinator, animated: true)
    }
}
