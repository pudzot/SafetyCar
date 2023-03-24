//
//  CarCurrentViewType.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 15/03/2023.
//

import Foundation

protocol CarCurrentViewType: AnyObject {
    
    func display(dataSource: CarCurrentDataSource)
    
}
