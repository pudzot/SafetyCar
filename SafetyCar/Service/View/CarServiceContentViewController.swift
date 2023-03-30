//
//  CarServiceContentViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 27/03/2023.
//

import Foundation
import UIKit

class CarServiceContentViewController: BaseViewController<CarServiceView> {
    
    private let dataSource: CarServiceDataSource
    
    init(dataSource: CarServiceDataSource) {
        self.dataSource = dataSource
        super.init()
    }
    
    override func loadView() {
        self.view = View()
        self.configureView()
        
    }
    
    func configureView() {
        self.customView.tableView.dataSource = dataSource
        self.customView.tableView.delegate = self
        
      }
}

extension CarServiceContentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
