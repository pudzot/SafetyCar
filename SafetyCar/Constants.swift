//
//  Constants.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import Foundation
import FirebaseDatabase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("USERS")
let REF_CARS = DB_REF.child("CARS")
let REF_USER_CARS = DB_REF.child("USER-CARS")


struct Constants {
    
    
    //static let backgroundColor = "#181a18"
    static let backgroundColor = "#2c2e2b" //zmienic kolor przy paliwie tlo odwrocic kolory 
}
    
    let userName = "User Car 1"
    
    enum NotificationTitle: String {
        case leaveZone   = "UWAGA! UWAGA!"
    }
    
    enum NotificationSubtitle: String {
        case leaveZone   = "Opuściłeś strefe"
    }
    
    enum NotificationRequestIdentifier: String {
        case leaveZone   = "Notification.LeaveZone"
    }
    
    enum RegionIdentifier: String {
        case home = "Home"
    }
    
