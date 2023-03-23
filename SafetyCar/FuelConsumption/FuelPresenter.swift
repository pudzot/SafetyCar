//
//  FuelPresenter.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 15/03/2023.
//

import UIKit

protocol FuelViewType: AnyObject {
    
    func display(items: String)
}

protocol FuelPresenterType: AnyObject {
    
    func attach(_ view: FuelViewType)
}

//protocol FuelNavigationDelegate: AnyObject {
//
//    func AddFuel()
//}

final class FuelPresenter {
    
    private weak var view: FuelViewType?
    
//    private weak var navigationDelegate: FuelNavigationDelegate?
//
//    init(navigationDelegate: FuelNavigationDelegate) {
//        self.navigationDelegate = navigationDelegate
//    }
}

extension FuelPresenter: FuelPresenterType {
    
    func attach(_ view: FuelViewType) {
        self.view = view
        self.presentFuel()
    }
}

private extension FuelPresenter {
    func presentFuel() {
        self.view?.display(items: "historia tankowan")
    }
}
