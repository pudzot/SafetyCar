//
//  CarServiceModel.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 27/03/2023.
//

import Foundation
import UIKit

struct CarService {
    let id: String
    let uid: String
    // let images: String
    let title: String
    let description: String
    let odometer: String
    let cost: String
    var date: Date!
    let carID: String
    
    init(id: String, carID: String, dictionary: [String: AnyObject]) {
        self.id = id
        self.carID = carID
        self.uid = dictionary["uid"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.cost = dictionary["cost"] as? String ?? ""
        self.odometer = dictionary["odometer"] as? String ?? ""
        
        if let date = dictionary["dateService"] as? Double {
            self.date = Date(timeIntervalSince1970: date)
        }
    }
}

struct AddCarService {
    let image: UIImage
    let title: String
    let description: String
    let odometer: String
    let cost: String
    let dateService: Date
}
