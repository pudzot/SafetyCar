//
//  GarageView.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 23/03/2023.
//

import UIKit
import TPCommon

class GarageView: BaseView {
    
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        }
        
        tableView.register(cellType: GarageTableViewCell.self)
        tableView.register(cellType: UITableViewCell.self)
        return tableView
    }()
    
    override func setup() {
        self.backgroundColor = .white
        
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
