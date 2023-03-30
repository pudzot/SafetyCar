//
//  ErrorContentView.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 30/03/2023.
//

import UIKit
import Lottie

class ErrorContentView: BaseView {
    
    lazy var animationView:  LottieAnimationView = {
        let animationView = LottieAnimationView(name: "38435-register")
        animationView.play()
        animationView.loopMode = .loop
        return animationView
    }()
    
    private lazy var descriptionLabel: BaseLabel = {
        let label = BaseLabel()
        label.text = "Błąd połączenia lub brak danych do wyświetlenia"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func setup() {
        self.backgroundColor = .white
        self.addSubviews(animationView, descriptionLabel)
    }
    
    override func makeConstraints() {
        self.animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.height.equalTo(200)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(36)
            make.top.equalTo(animationView.snp.bottom).offset(36)
        }
    }
}

