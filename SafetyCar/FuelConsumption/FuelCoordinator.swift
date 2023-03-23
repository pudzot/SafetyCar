//
//  FuelCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 15/03/2023.
//

import UIKit

final class FuelCoordinator: NewCoordinator {
    
    private lazy var viewController: UIViewController = {
        let presenter = FuelPresenter()
        return FuelViewController(presenter: presenter)
    }()
    
   public override func toPresentable() -> UIViewController {
        return viewController
    }
}
