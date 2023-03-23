//
//  WelcomeView.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 10/03/2023.
//
import Foundation
import UIKit
import Lottie
import SnapKit

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

class WelcomeView: UIView {
    
    private lazy var screenBackground: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "38435-register")
        animationView.play()
        animationView.loopMode = .loop
        return animationView
    }()
    
    let emailTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Е-mail"
        textField.layer.cornerRadius = 6
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        return textField
    }()
    
    let passwordTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Hasło"
        textField.layer.cornerRadius = 6
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textContentType = .password
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = UIColor(hexString: "#2F80ED")
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //isHidden = true
        self.addSubview(screenBackground)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        screenBackground.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(200)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.top.equalTo(screenBackground.snp.bottom).inset(-32)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.top.equalTo(emailTextField.snp.bottom).inset(-8)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).inset(-12)
            make.height.equalTo(50)
        }
    }
}
