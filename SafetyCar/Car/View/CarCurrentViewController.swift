//
//  CarCurrentViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 11/03/2023.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CarCurrentViewController: BaseContentStateViewController {
    
    private let presenter: CarCurrentPresenterType
    init(presenter: CarCurrentPresenterType) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.attachView(self)
        navigationItem.title = "My Car"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "private-garage"), style: .done, target: self, action: #selector(didTapGarage))
        
    }
    
    @objc func didTapGarage() {
        presenter.presentGarage()
    }
}

extension CarCurrentViewController: CarCurrentViewType {
    func display(dataSource: CarCurrentDataSource) {
        let viewController = CarCurrentContentViewController(dataSource: dataSource, output: self)
        
        self.transition(to: .render(viewController))
    }
}

extension CarCurrentViewController: CarCurrentContentViewControllerOutput {
    func didSelect(carID: String, vehicleCell: VehicleCell) {
        self.presenter.open(vehicleCell.elements)
    }
    
    
    
}
    

        
    
    

