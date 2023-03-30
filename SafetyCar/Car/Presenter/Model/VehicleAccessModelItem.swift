//
//  VehicleAccessModelItem.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 15/03/2023.
//

import Foundation

struct VehicleCell {
    var image: String? = "mercedes"
    var elements: VehicleCellItem
}

public enum VehicleCellItem {
    
    case service
    case fuel
    
    var title: String {
        switch self {
        case .service:
            return "Serwis"
        case .fuel:
            return "Paliwo"
        }
    }
}
