//
//  GarageViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 20/03/2023.
//

import UIKit

final class GarageViewController: UIViewController, GarageViewType {

    func display(items: [Car]) {
        self.cars = items
        tableView.reloadData()
    }
    
    var cars = [Car]()
    private let presenter: GaragePresenter
    
    init(presenter: GaragePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var service = CarsService()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(GarageTableViewCell.self, forCellReuseIdentifier: GarageTableViewCell.identifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.attach(self)
        self.setupTableView()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(addVehicle))
        navigationItem.title = "My Garage"
    }
    
    @objc func addVehicle() {
//        let model = AddCar(uid: "", brand: "Audi", model: "A3", year: 2009, fuelType: "Diesel", odometer: "200100")
//       // let model = AddCar(uid: "", brand: "Mercedes", model: "A200", year: 2015, fuelType: "Diesel", odometer: "165514")
//        service.uploadCars(forModel: model) { Error, ref in
//        }
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func setupTableView() {
         view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GarageViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GarageTableViewCell.identifier, for: indexPath) as! GarageTableViewCell
        
        let model = cars[indexPath.row]
        //cell configure
        cell.configure(with: model)
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let car = cars[indexPath.row]
        print(car.carID)
       
        //self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}


