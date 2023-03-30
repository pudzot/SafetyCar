//
//  CarServiceViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 14/03/2023.
//

import UIKit

final class CarServiceViewController: BaseContentStateViewController {
    
    private let presenter: CarServicePresenter
    
    init(presenter: CarServicePresenter) {
        self.presenter = presenter
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(self)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        self.presenter.presentAddService()
    }
}

extension CarServiceViewController: CarServiceViewType {
    
    func displayShowError(_ text: String) {
       
        let viewController = ErrorContentViewController()
        self.transition(to: .failed(viewController))
    }
    
    func display(dataSource: CarServiceDataSource) {
        let viewController = CarServiceContentViewController(dataSource: dataSource)
        
        self.transition(to: .render(viewController))
    }
}
