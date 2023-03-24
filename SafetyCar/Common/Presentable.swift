//
//  Presentable.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import UIKit

public protocol Presentable {
    func toPresentable() -> UIViewController
}

extension UIViewController: Presentable {
    public func toPresentable() -> UIViewController {
        return self
    }
}
