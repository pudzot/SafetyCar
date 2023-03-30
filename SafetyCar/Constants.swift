//
//  Constants.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGE_CARS = STORAGE_REF.child("profile_image_cars")
let STORAGE_OTHER_IMAGE = STORAGE_REF.child("other_image")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("USERS")
let REF_CARS = DB_REF.child("CARS")
let REF_USER_CARS = DB_REF.child("USER-CARS")
let REF_SERVICE = DB_REF.child("SERVICES")




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
    
