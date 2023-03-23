//
//  FuelViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 15/03/2023.
//

import UIKit

final class FuelViewController: UIViewController {
  
    private let presenter: FuelPresenter
    
    init(presenter: FuelPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(FuelTableViewCell.self, forCellReuseIdentifier: FuelTableViewCell.identifier)
        tableView.backgroundColor = UIColor(hexString: Constants.backgroundColor)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        self.navigationItem.title = "Historia Tankowań"
        tableView.backgroundColor = UIColor(hexString: Constants.backgroundColor)
        self.presenter.attach(self)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.rowHeight = 100
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FuelViewController: FuelViewType {
    func display(items: String) {
        print("to jest \(items)")
    }
    
    
}

extension FuelViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FuelTableViewCell.identifier, for: indexPath) as? FuelTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: "Przebieg ")
        return cell
    }
}
