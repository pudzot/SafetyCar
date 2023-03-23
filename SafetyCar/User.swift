//
//  User.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 18/03/2023.
//

import Foundation
import Firebase

struct User {
    var fullname: String
    let email: String
    var username: String
    let uid: String
    
    init(uid:String, dictionary: [String : AnyObject]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
    }
}
