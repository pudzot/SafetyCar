//
//  Coordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import UIKit

public protocol BaseCoordinatorType: AnyObject {
    func start()
}

public protocol PresentableCoordinatorType: BaseCoordinatorType, Presentable {}

open class PresentableCoordinator: NSObject, PresentableCoordinatorType {
    
    public override init() {
        super.init()
    }
    
    open func start() {
    }

    open func toPresentable() -> UIViewController {
        fatalError("Must override toPresentable()")
    }
}


public protocol CoordinatorType: PresentableCoordinatorType {
    var router: RouterType { get }
}

open class NewCoordinator: PresentableCoordinator, CoordinatorType  {
    
    public var childCoordinators: [NewCoordinator] = []
    
    open var router: RouterType
    
    public init(router: RouterType) {
        self.router = router
        super.init()
    }
    
    deinit {
        print("\(type(of: self)) -> \(#function)")
    }
    
    public func addChild(_ coordinator: NewCoordinator) {
        childCoordinators.append(coordinator)
    }
    
    public func removeChild(_ coordinator: NewCoordinator?) {
        if let coordinator = coordinator, let index = childCoordinators.index(of: coordinator) {
            childCoordinators.remove(at: index)
        }
    }
    
    open override func toPresentable() -> UIViewController {
        return router.toPresentable()
    }
}
