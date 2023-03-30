//
//  CarServiceView.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 28/03/2023.
//

import UIKit

class CarServiceView: BaseView {
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
            tableView = UITableView(frame: .zero, style: .plain)
            tableView.register(cellType: CarServiceTableViewCell.self)
        return tableView
    }()
    
    override func setup() {
        self.tableView.backgroundColor = .systemGray6
        self.tableView.separatorStyle = .none
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
