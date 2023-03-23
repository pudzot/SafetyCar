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
    
    case lock
    case fuel
    
    var title: String {
        switch self {
        case .lock:
            return "Blokada"
        case .fuel:
            return "Paliwo"
        }
    }
}
