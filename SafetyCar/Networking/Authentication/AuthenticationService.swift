//
//  AuthenticationService.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 18/03/2023.
//

import UIKit
import Firebase


struct AuthenticationCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
   // let profileImage: UIImage
}

struct AuthenticationService {
    
    func logInUser(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
    
    func registerUser(credentials: AuthenticationCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let username = credentials.username
        let fullname = credentials.fullname
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: Erros is \(error.localizedDescription)")
                        return
                    }
                    
                    guard let uid = result?.user.uid else {return}
                    
                    let values = ["email": email,
                                  "username": username,
                                  "fullname": fullname]
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
    
        }
    }
}

