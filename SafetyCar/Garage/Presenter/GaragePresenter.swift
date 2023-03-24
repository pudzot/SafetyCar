//
//  GaragePresenter.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 20/03/2023.
//

import Foundation
import FirebaseAuth





final class GaragePresenter {
    
    private weak var view: GarageViewType?
    
    private weak var navigationDelegate: GarageNavigationDelegate?
    
    init(navigationDelegate: GarageNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    private let carService = CarsService()
    
    private var cars = [Car]()
}

extension GaragePresenter: GaragePresenterType {
   
    func presentSelectedCar(id: String) {
        navigationDelegate?.openSelectedCar(id: id)
    }
    
    
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
