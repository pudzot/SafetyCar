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
//        let model = AddCar(uid: "", brand: "Audi", model: "A3", year: 2009, fuelType: "Diesel", odometer: "200100")
//       // let model = AddCar(uid: "", brand: "Mercedes", model: "A200", year: 2015, fuelType: "Diesel", odometer: "165514")
//        service.uploadCars(forModel: model) { Error, ref in
//        }
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


