//
//  GarageContentViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 23/03/2023.
//

import UIKit

protocol GarageContentViewControllerOutput: AnyObject {
    func didSelectCar(id: String)
}

class GarageContentViewController: BaseViewController<GarageView> {

    private var cars: [Car] = []
    
    private weak var output: GarageContentViewControllerOutput?
    
    init(cars: [Car],
         output: GarageContentViewControllerOutput) {
        self.cars = cars
        self.output = output
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = View()
        self.configureView()
    }
    
    func configureView() {
        self.customView.tableView.dataSource = self
        self.customView.tableView.delegate = self

      }
}

extension GarageContentViewController: UITableViewDataSource, UITableViewDelegate {

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
        output?.didSelectCar(id: car.carID)
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

