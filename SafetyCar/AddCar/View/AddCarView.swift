//
//  AddCarView.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 24/03/2023.
//

import UIKit

class AddCarView: BaseView {
    
    var didClickChangeImage: (()->(Void))?
    
     let carProfileImage: UIImageView = {
        let image = UIImage(named: "addPhoto")
        let imageView = UIImageView(image: image)
         imageView.contentMode = .scaleAspectFit
       // imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .gray
       
        return imageView
    }()
    
    @objc func didTapImage(sender: UITapGestureRecognizer) {
        self.didClickChangeImage?()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dodaj pojazd"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        return label
    }()
    
    let brandTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Marka"
        textField.layer.cornerRadius = 6
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        return textField
    }()
    
    let modelTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Model"
        textField.layer.cornerRadius = 6
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        return textField
    }()
    
    let yearTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Rok produkcji"
        textField.layer.cornerRadius = 6
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        return textField
    }()
    
    let fuelTypeTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Rodzaj paliwa"
        textField.layer.cornerRadius = 6
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        return textField
    }()
    
    let odometerTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Przebieg"
        textField.layer.cornerRadius = 6
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        return textField
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dodaj", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.backgroundColor = UIColor(hexString: "#2F80ED")
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func setup() {
        self.addSubviews(carProfileImage,
                         titleLabel,
                         brandTextField,
                         modelTextField,
                         yearTextField,
                         fuelTypeTextField,
                         odometerTextField,
                         addButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        carProfileImage.addGestureRecognizer(tap)
        carProfileImage.isUserInteractionEnabled = true
    }
    
    override func makeConstraints() {
        carProfileImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.top.equalTo(carProfileImage.snp.bottom).inset(-20)
        }
        
        brandTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(30)
            make.top.equalTo(titleLabel.snp.bottom).inset(-8)
        }
        
        modelTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(30)
            make.top.equalTo(brandTextField.snp.bottom).inset(-8)
        }
        
        yearTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(30)
            make.top.equalTo(modelTextField.snp.bottom).inset(-8)
        }
        
        fuelTypeTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(30)
            make.top.equalTo(yearTextField.snp.bottom).inset(-8)
        }
        
        odometerTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(30)
            make.top.equalTo(fuelTypeTextField.snp.bottom).inset(-8)
        }
        
        addButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(odometerTextField.snp.bottom).inset(-12)
            make.height.equalTo(50)
        }
        
    }
}
