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
    
    var selectedCarID: String = "-NR3a8u8Zjvx3RHBXTW-" {
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
        items.append(VehicleCell(image: "mercedes", elements: .lock))
        items.append(VehicleCell(image: "lesson_placeholder", elements: .fuel))
                     
        self.view?.display(vehicleItems: items, model: model)
    }
    
    func fetchCars() {
        if !self.selectedCarID.isEmpty {
            fetchCar(with: selectedCarID)
        } else {
            serviceCar.fetchCarsForUser { results in
//                let carid = results
//                    .filter { $0.carID == self.selectedCarID }
//                    .map { $0 }
//                print(carid)
        }
        }
    }
    
    func fetchCar(with carID: String) {
        serviceCar.fetchCar(withCarID: carID) { result in
            self.prepareViewModel(model: result)
        }
    }
    
    func open(_ item: VehicleCellItem) {
        switch item {
        case .lock:
            print("lock")
            
        case .fuel:
            print("fuel")
            self.navigationDelegate?.openFuel()
        }
    }
    
    func presentGarage() {
        self.navigationDelegate?.openGarage()
    }
}
