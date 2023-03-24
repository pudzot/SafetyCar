//
//  CarCurrentDataSource.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 23/03/2023.
//

import UIKit

class CarCurrentDataSource: NSObject {
    
        var car: Car
        var vehicleItems: [VehicleCell]
    
     init(vehicleItems:[VehicleCell], car: Car) {
        self.vehicleItems = vehicleItems
        self.car = car
    }
}

extension CarCurrentDataSource: UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return vehicleItems.count
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCurrentCollectionViewCell", for: indexPath) as! CarCurrentCollectionViewCell
        
                cell.configure(vehicleItem: vehicleItems[indexPath.row])
            return cell
        }
    
     func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CarCurrentHeaderView", for: indexPath) as? CarCurrentHeaderView else {
                return UICollectionReusableView()
            }

            headerView.configure(model: car)
                
            return headerView
    }
    
}

