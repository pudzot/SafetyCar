//
//  GarageCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 20/03/2023.
//

import UIKit

final class GarageCoordinator: NewCoordinator {
    
    private lazy var viewController: UIViewController = {
        let presenter = GaragePresenter()
        return GarageViewController(presenter: presenter)
    }()
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(viewController, hideBar: false)
    }
}
