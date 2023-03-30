//
//  AddCarPresenter.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 24/03/2023.
//

import UIKit

final class AddCarPresenter {
    
    private lazy var service = CarsService()
    
    private weak var view: AddCarViewType?
    
    //    private var navigationDelegate: AddCarNavigationDelegate?
    //    
    //    init(navigationDelegate: AddCarNavigationDelegate) {
    //            self.navigationDelegate = navigationDelegate
    //    }
    
}
extension AddCarPresenter: AddCarPresenterType {
    
    func addNewCar(model: AddCar) {
        print(model)
        self.service.uploadCar(forModel: model) { err, ref in
            if err != nil {
                print("nie udalo sie")
                //self.view?.showError("nie zalogowano")
            } else {
                print("udało sie ")
            }
        }
    }
    
    func attach(_ view: AddCarViewType) {
        self.view = view
    }
}


