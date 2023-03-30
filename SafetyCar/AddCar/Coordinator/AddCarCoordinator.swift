//
//  AddCarCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 24/03/2023.
//

import UIKit

final class AddCarCoordinator: NewCoordinator {
    
    var onClose: (() -> Void)?
    
    private lazy var viewController: UIViewController = {
        let presenter = AddCarPresenter()
        return AddCarViewController(presenter: presenter)
    }()
    
//    public override func toPresentable() -> UIViewController {
//        return viewController
//    }
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(viewController, hideBar: false)
        //router.setRootModule(viewController, hideBar: false)
    }
}

 
