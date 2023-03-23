//
//  WelcomePresenter.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 08/03/2023.
//

import Foundation

protocol WelcomePresenterNavigationDelegate: AnyObject {

    func didOpenDashboard()
}

enum AuthResult {
    case verified
    case emptyAccount
}

protocol WelcomeViewType: AnyObject {
    
    func showError(_ text: String)
}

protocol WelcomePresenterType {
    func attachView(_ view: WelcomeViewType)
    func signIn(email: String, password: String)
    func registerUser(username: String, fullname: String, email: String, password: String)
}

class WelcomePresenter {
    
    private lazy var service = AuthenticationService()
    
    //MARK: - Navigation -
    private weak var navigationDelegate: WelcomePresenterNavigationDelegate?
    
    init(navigationDelegate: WelcomePresenterNavigationDelegate?) {
        self.navigationDelegate = navigationDelegate
    }
    
    //MARK: - View
    private  var view: WelcomeViewType?

    func attachView(_ view: WelcomeViewType) {
        self.view = view
    }
}

extension WelcomePresenter: WelcomePresenterType {
    
    func signIn(email: String, password: String) {
        service.logInUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("User is not logged")
                self.view?.showError("nie zalogowano")
            } else {
                DispatchQueue.main.async {
                    self.navigationDelegate?.didOpenDashboard()
                }
            }
        }
    }
    
    func registerUser(username: String, fullname: String, email: String, password: String) {
        let credentials = AuthenticationCredentials(email: email, password: password, fullname: fullname, username: username)
        service.registerUser(credentials: credentials) { Error, ref in
            print(ref)
        }
    }
}
