//
//  Store.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import Foundation
import Firebase

protocol StoreType: AnyObject {
    var isLoggedIn: Bool {get}
    var delegate: StoreDelegate? { get set }
}

protocol StoreDelegate: AnyObject {
    func store(_ store: StoreType, didChangeLogginState isLoggedIn: Bool)
}

class Store: StoreType {
    weak var delegate: StoreDelegate?
    
    var isLoggedIn: Bool = {
        if Auth.auth().currentUser == nil {
            print("DEBUG: User is NOT logged in...")
            return false
        } else {
            return true
        }
    }()
}
