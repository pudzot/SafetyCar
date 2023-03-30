//
//  CarServiceViewType.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 27/03/2023.
//

import Foundation

protocol CarServiceViewType: AnyObject {
    
    func display(dataSource: CarServiceDataSource)

    func displayShowError(_ text: String)
}
