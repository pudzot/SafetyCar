//
//  AppCoordinator.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import UIKit

class AppCoordinator: NewCoordinator {
    
    private let store: StoreType
    
    init(router: RouterType,
         store: StoreType) {
        self.store = store
        super.init(router: router)
        self.store.delegate = self
    }
    
    override func start() {
        self.showScreen()
    }
    
    func showScreen() {
        if store.isLoggedIn {
            print("Logged true: \(store.isLoggedIn)")
            self.presentMainFlow()
        } else {
            print("Logged false: \(store.isLoggedIn)")
            self.presentAuthFlow()
        }
    }
    
    func presentAuthFlow() {
        print("nie zalogowano")
        
        let coordinator = WelcomeCoordinator(router: router)
        addChild(coordinator)
        
        coordinator.onAuthenticated = { [weak self] in
            self?.removeChild(coordinator)
            self?.presentMainFlow()
        }
        
        router.push(coordinator, animated: true, completion: nil)
    }
    
    private func presentMainFlow() {
        print("ZALOGOWANO tab bar ")
        let coordinator = TabBarCoordinator(router: router, store: store)
        addChild(coordinator)
        coordinator.start()
    }
}

extension AppCoordinator: StoreDelegate {
    
    func store(_ store: StoreType, didChangeLogginState isLoggedIn: Bool) {
        if !isLoggedIn {
            guard let coordinator = self.childCoordinators.last else { return }
            self.removeChild(coordinator)
            self.presentAuthFlow()
        }
        print(store)
        print(isLoggedIn)
    }
}
