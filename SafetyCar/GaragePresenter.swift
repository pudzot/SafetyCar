//
//  GaragePresenter.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 20/03/2023.
//

import Foundation
import FirebaseAuth

protocol GarageNavigationDelegate: AnyObject {
    func didSelectCar(id: String)
}

protocol GarageViewType: AnyObject {
    
    func display(items: [Car])

}

protocol GaragePresenterType: AnyObject {
    
    func attach(_ view: GarageViewType)
    
}

final class GaragePresenter {
    
    private weak var view: GarageViewType?
    
    private let carService = CarsService()

}

extension GaragePresenter: GaragePresenterType {
    
    func attach(_ view: GarageViewType) {
        self.view = view
        self.fetchCars()
    }
}

private extension GaragePresenter {
        
        func fetchCars() {
            self.carService.fetchCarsForUser { cars in
                self.view?.display(items: cars)
            }
        }
    }
