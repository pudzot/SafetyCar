//
//  CarCurrentPresenter.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 12/03/2023.
//

import UIKit
import FirebaseAuth

final class CarCurrentPresenter {
    
    private weak var view: CarCurrentViewType?
    
    private lazy var serviceCar = CarsService()
    
    var car: Car?

    var selectedCarID: String = UserDefaults.standard.string(forKey: "carID") ?? "" {
        didSet {
            fetchCars()
        }
    }
    
    private weak var navigationDelegate: CarCurrentNavigationDelegate?
    
    init(navigationDelegate: CarCurrentNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
}

extension CarCurrentPresenter: CarCurrentPresenterType {

    func attachView(_ view: CarCurrentViewType) {
        self.view = view
        fetchCars()
    }
    
    func prepareViewModel(model: Car) {
        var items = [VehicleCell]()
        items.append(VehicleCell(image: "carService", elements: .service))
        items.append(VehicleCell(image: "fuel", elements: .fuel))
        let dataSource = CarCurrentDataSource(vehicleItems: items, car: model)
        UserDefaults.standard.set(model.carID, forKey: "carID")
        self.view?.display(dataSource: dataSource)
    }
    
    func fetchCars() {
        if !self.selectedCarID.isEmpty {
            fetchCar(with: selectedCarID)
        } else {
            serviceCar.fetchCarsForUser { results in
                let carid = results
                    .map { $0.carID }
    
                self.fetchCar(with: carid[0])
        }
        }
    }
    
    func fetchCar(with carID: String) {
        serviceCar.fetchCar(withCarID: carID) { result in
            self.car = result
            self.prepareViewModel(model: result)
            
        }
    }
    
    func open(_ item: VehicleCellItem) {
        switch item {
        case .service:
            print("Serwis")
            guard let car = car else { return }
            print(car.carID)
            self.navigationDelegate?.openCarService(car: car)
            
        case .fuel:
            print("fuel")
            self.navigationDelegate?.openFuel()
        }
    }
    
    func presentGarage() {
        self.navigationDelegate?.openGarage()
    }
}
