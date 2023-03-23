//
//  ViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 06/03/2023.
//

import UIKit

class WelcomeViewController: UIViewController, WelcomeViewType {
    
    func showError(_ text: String) {
        print(text)
    }
    
    private let presenter: WelcomePresenterType
    
    init(presenter: WelcomePresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    let welcomeView = WelcomeView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        print("load View")
        self.view.backgroundColor = .white
        self.view.addSubview(welcomeView)
        welcomeView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Welcome VC")
        self.presenter.attachView(self)
        self.welcomeView.loginButton.addTarget(self, action: #selector(didClickLogin), for: .touchUpInside)
    }
    
    @objc func didClickLogin() {
        guard let email = self.welcomeView.emailTextField.text, !email.isEmpty else {
            showAlert(title: "Alert", message: "Wrong email format", okTitle: "OK")
            return
        }
        
        guard let password = self.welcomeView.passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Alert", message: "Wrong password", okTitle: "OK")
            return
        }
        self.presenter.signIn(email: email, password: password)
    }
    
    
    
    //Invoking the authorizeNotification method in NotificationService class
//        NotificationService.sharedInstance.authorizeNotification()
//
//        //Invoking the authorizeNotification method in LocationService class
//        LocationService.sharedInstance.authorizeLocation()
//
//        NotificationCenter.default.addObserver(self, selector: #selector(userLoggedIn), name: Notification.Name("UserLoggedIn"), object: nil)
    
    @objc func userLoggedIn() {
        print("powiadomienie")
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func TapButton(_ sender: Any) {
        showToast(message: "zablokowany")
        NotificationService.sharedInstance.requestLocationNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

