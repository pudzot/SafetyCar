//
//  GarageViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 20/03/2023.
//

import UIKit

final class GarageViewController: BaseContentStateViewController {

    private let presenter: GaragePresenter
    
    init(presenter: GaragePresenter) {
        self.presenter = presenter
        super.init()
    }
    
    private lazy var service = CarsService()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.attach(self)
        
        view.backgroundColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(addVehicle))
        navigationItem.title = "My Garage"
    }
    
    @objc func addVehicle() {
        self.presenter.presentAddCar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GarageViewController: GarageViewType {
    func display(items: [Car]) {
        print(items)
        let viewController = GarageContentViewController(cars: items, output: self)
  
        self.transition(to: .render(viewController))
    }
}

extension GarageViewController: GarageContentViewControllerOutput {

    func didSelectCar(id: String) {
        print("test \(id)")
        presenter.presentSelectedCar(id: id)
    }


}


