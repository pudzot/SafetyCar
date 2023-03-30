//
//  CarServiceDataSource.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 27/03/2023.
//

import Foundation
import UIKit

class CarServiceDataSource: NSObject {
    
    let services: [CarService]
    
    init(services: [CarService]) {
        self.services = services
    }
}

extension CarServiceDataSource: UITableViewDataSource {
    
    // MARK: - Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarServiceTableViewCell.identifier, for: indexPath) as? CarServiceTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: services[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}
