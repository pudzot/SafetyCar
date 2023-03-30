//
//  GaragePresenterType.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 24/03/2023.
//


protocol GarageNavigationDelegate: AnyObject {
    
    func openSelectedCar(id: String)
    
    func openAddCar()
}

protocol GaragePresenterType: AnyObject {
    
    func attach(_ view: GarageViewType)
    
    func presentSelectedCar(id: String)
    
    func presentAddCar()
}
