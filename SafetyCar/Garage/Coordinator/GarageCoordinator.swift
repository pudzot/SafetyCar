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
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(viewController, hideBar: false)
    }
}

extension GarageCoordinator: GarageNavigationDelegate {
    func openSelectedCar(id: String) {
        print("przekazane ID \(id)")
        self.didSelect?(id)
    }
}
