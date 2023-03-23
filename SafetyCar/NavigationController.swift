//
//  NavigationController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import UIKit

class NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    deinit {
        print("\(type(of: self)) -> \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
}
