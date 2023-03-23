//
//  CarsService.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 18/03/2023.
//

import UIKit
import Firebase

struct CarsService {
    
    
    func uploadCars(forModel model: AddCar,  completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        var values = ["uid": uid,
                      "timestamp": Int(NSDate().timeIntervalSince1970),
                      "brand": model.brand,
                      "model": model.model,
                      "year": model.year,
                      "fuelType": model.fuelType,
                      "odometer": model.odometer] as [String : Any]
        
            REF_CARS.childByAutoId().updateChildValues(values) { err, ref in
                // update user-tweet structure after tweet upload complete
                guard let carID = ref.key else { return }
                REF_USER_CARS.child(uid).updateChildValues([carID: 1], withCompletionBlock: completion)
        }
    }
    
    func fetchCarsForUser(completion: @escaping([Car]) -> Void) {
        var cars = [Car]()
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        REF_USER_CARS.child(uid).observe(.childAdded) { snapshot in
            let carID = snapshot.key
            self.fetchCar(withCarID: carID) { car in
                cars.append(car)
                completion(cars)
            }
        }
    }
    
    func fetchCar(withCarID carID: String, completion: @escaping(Car) -> Void) {
        REF_CARS.child(carID).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else {return}
            guard let uid = dictionary["uid"] as? String else {return}
            
            UserService.shared.fetchUser(uid: uid) { user in
                let car = Car(user: user, carID: carID, dictionary: dictionary)
                completion(car)
            }
        }
    }
}
