//
//  CarServicePresenter.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 14/03/2023.
//

import Foundation

final class CarServicePresenter {
    
    private weak var view: CarServiceViewType?
    
    private lazy var service = CarsService()
    
    private weak var navigationDelegate: CarServiceNavigationDelegate?
    
    var car: Car
    init(car: Car, navigationDelegate: CarServiceNavigationDelegate) {
        self.car = car
        self.navigationDelegate = navigationDelegate
    }
}

extension CarServicePresenter: CarServicePresenterType {
    func presentAddService() {
        navigationDelegate?.openAddService(with: car)
    }
    
    func attach(_ view: CarServiceViewType) {
        self.view = view
        self.fetchCarService()
    }
}

private extension CarServicePresenter {
    
    func fetchCarService() {
        self.service.fetchServicesCar(carID: car.carID) { services in
            if services.isEmpty {
                self.view?.displayShowError("Brak danych")
            } else {
                let dataSource = CarServiceDataSource(services: services)
                self.view?.display(dataSource: dataSource)
            }
        }
    }
}
