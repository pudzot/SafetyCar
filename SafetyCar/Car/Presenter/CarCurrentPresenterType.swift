//
//  CarCurrentPresenterType.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 15/03/2023.
//

import Foundation

protocol CarCurrentNavigationDelegate: AnyObject {
    func openFuel()
    func openGarage()
}

protocol CarCurrentPresenterType {
    
    func attachView(_ view: CarCurrentViewType)
    
    func open(_ item: VehicleCellItem)
    
    func presentGarage()
}


