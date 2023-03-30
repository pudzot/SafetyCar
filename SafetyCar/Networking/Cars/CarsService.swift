//
//  CarsService.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 18/03/2023.
//

import UIKit
import Firebase
import FirebaseDatabase

struct CarsService {
    
    func fetchServicesCar(carID: String, completion: @escaping([CarService]) -> Void) {
        var services = [CarService]()
        
        REF_SERVICE.child(carID).observeSingleEvent(of: .value) { snapshot, error  in
            if snapshot.exists() {
                guard let dictionary = snapshot.value as? [String: AnyObject] else {return}
                let carID = snapshot.key
                
                
                dictionary.forEach { element in
                    let serviceID = element.key
                    let value = element.value
                    
                    let service = CarService(id: serviceID, carID: carID, dictionary: value as! [String : AnyObject])
                    services.append(service)
                }
                completion(services)
            } else {
                completion([])
            }
        }
    }
    
    func uploadService(forModel model: AddCarService, carID: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}

        guard let imageData = model.image.jpegData(compressionQuality: 0.3) else {return}
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_OTHER_IMAGE.child(carID).child(filename)

        storageRef.putData(imageData, metadata: nil) { (meta, error) in
            storageRef.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else {return}
        
        let timestamp = model.dateService.timeIntervalSince1970

                let values = ["uid": uid,
                              "dateService": timestamp,
                              "title": model.title,
                              "description": model.description,
                              "odometer": model.odometer,
                              "cost": model.cost,
                              "carID": carID,
                              "serviceImage": imageUrl] as [String : Any]
                
        REF_SERVICE.child(carID).childByAutoId().updateChildValues(values) { err, ref in

            guard let serviceID = ref.key else { return }
            print(serviceID)
                }
            }
        }
    }
    
    func uploadCar(forModel model: AddCar,  completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let imageData = model.profileCarImage.jpegData(compressionQuality: 0.3) else {return}
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGE_CARS.child(filename)
        
        storageRef.putData(imageData, metadata: nil) { (meta, error) in
            storageRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else {return}
               // REF_CARS.child(carID).updateChildValues([model.profileCarImage: profileImageUrl], withCompletionBlock: completion)
                
                let values = ["uid": uid,
                              "timestamp": Int(NSDate().timeIntervalSince1970),
                              "brand": model.brand,
                              "model": model.model,
                              "year": model.year,
                              "fuelType": model.fuelType,
                              "odometer": model.odometer,
                              "profileCarImage": profileImageUrl] as [String : Any]
                
                REF_CARS.childByAutoId().updateChildValues(values) { err, ref in
                    // update user-cars structure after car upload complete
                    guard let carID = ref.key else { return }
               
                    REF_USER_CARS.child(uid).updateChildValues([carID: 1], withCompletionBlock: completion)
                }
            }
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
