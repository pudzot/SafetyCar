//
//  AddCarPresenterType.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 24/03/2023.
//

import UIKit

protocol AddCarPresenterType: AnyObject {
    
    func attach(_ view: AddCarViewType)
    
    func addNewCar(model: AddCar)
    
}
