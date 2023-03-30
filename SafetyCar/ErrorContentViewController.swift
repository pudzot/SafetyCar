//
//  ErrorContentViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 30/03/2023.
//

import UIKit

final class ErrorContentViewController: BaseViewController<ErrorContentView> {
    

    
    override func loadView() {
        self.view = View()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.customView.animationView.play()
    }
}



