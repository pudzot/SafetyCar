//
//  GarageCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 20/03/2023.
//

import UIKit

final class GarageCoordinator: NewCoordinator {
    
    var didSelect: ((String) -> Void)?
    
    private lazy var viewController: UIViewController = {
        let presenter = GaragePresenter(navigationDelegate: self)
        return GarageViewController(presenter: presenter)
    }()
    
    public override func toPresentable() -> UIViewController {
        return viewController
    }
    
    override init(router: RouterType) {
        super.init(router: router)
       // router.setRootModule(viewController, hideBar: false)
    }
}

extension GarageCoordinator: GarageNavigationDelegate {
    func openSelectedCar(id: String) {
        print("przekazane ID \(id)")
        self.didSelect?(id)
    }
    
    func openAddCar() {
        let navigationController = NavigationController()
        let router = Router(navigationController: navigationController)
        let coordinator = AddCarCoordinator(router: router)
        
        addChild(coordinator)
        
        coordinator.onClose = { [weak self, weak coordinator] in
            self?.removeChild(coordinator)
        }
       // self.router.push(coordinator, animated: true, completion: nil)
        self.router.present(coordinator, animated: true)
    }
}
