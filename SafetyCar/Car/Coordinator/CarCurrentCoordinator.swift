//
//  CarCurrentCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 11/03/2023.
//

import UIKit

class CarCurrentCoordinator: NewCoordinator {
    
    private lazy var presenter = CarCurrentPresenter(navigationDelegate: self)
    private lazy var viewController: CarCurrentViewController = {
        return CarCurrentViewController(presenter: presenter)
    }()
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(viewController, hideBar: false)
    }
}

extension CarCurrentCoordinator: CarCurrentNavigationDelegate {
   
    func openGarage() {
//        let navigationController = NavigationController()
//        let router = Router(navigationController: navigationController)
        let coordinator = GarageCoordinator(router: router)
       
        coordinator.didSelect = { [weak self, weak coordinator] IDCar  in
            print(IDCar)
            self!.presenter.selectedCarID = IDCar
            self?.removeChild(coordinator)
            self?.router.popToRootModule(animated: true)
        }
        
        addChild(coordinator)
        router.push(coordinator, animated: true) { [weak self, weak coordinator] in
            self?.removeChild(coordinator)
        }
    }
    
   
    func openFuel() {
        let coordinator = FuelCoordinator(router: router)
        addChild(coordinator)
        
        router.push(coordinator, animated: true) { [weak self, weak coordinator] in
            // this executes when the back button is pressed
            self?.removeChild(coordinator)
        }
    }
}
