//
//  CarServicePresenterType.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 27/03/2023.
//

import Foundation

protocol CarServiceNavigationDelegate: AnyObject {
    func openAddService(with car: Car)
}

protocol CarServicePresenterType: AnyObject {
    
    func attach(_ view: CarServiceViewType)
    
    func presentAddService()
}
