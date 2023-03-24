//
//  GaragePresenterType.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 24/03/2023.
//


protocol GarageNavigationDelegate: AnyObject {
    
    func openSelectedCar(id: String)
}

protocol GaragePresenterType: AnyObject {
    
    func attach(_ view: GarageViewType)
    
    func presentSelectedCar(id: String)
    
}
