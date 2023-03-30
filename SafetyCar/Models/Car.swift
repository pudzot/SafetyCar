//
//  CarItem.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 18/03/2023.
//

import UIKit

public struct Car {
    let uid: String
    let brand: String
    let model: String
    let year: Int
    let fuelType: String
    let odometer: String
    let carID: String
    let user: User
    let profileCarImage: String
    
    init(user: User, carID: String, dictionary: [String: AnyObject]) {
        self.carID = carID
        self.user = user
        self.uid = dictionary["uid"] as? String ?? ""
        self.brand = dictionary["brand"] as? String ?? ""
        self.model = dictionary["model"] as? String ?? ""
        self.year = dictionary["year"] as? Int ?? 0
        self.fuelType = dictionary["fuelType"] as? String ?? ""
        self.odometer = dictionary["odometer"] as? String ?? ""
        self.profileCarImage = dictionary["profileCarImage"] as? String ?? ""
    }
}

public struct AddCar {
    let brand: String
    let model: String
    let year: Int
    let fuelType: String
    let odometer: String
    let profileCarImage: UIImage
    
    init(brand: String, model: String, year: Int, fuelType: String, odometer: String, profileCarImage: UIImage) {
        self.brand = brand
        self.model = model
        self.year = year
        self.fuelType = fuelType
        self.odometer = odometer
        self.profileCarImage = profileCarImage
    }
}
