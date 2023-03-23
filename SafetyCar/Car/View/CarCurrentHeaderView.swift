//
//  CarCurrentHeaderView.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 11/03/2023.
//

import UIKit

final class CarCurrentHeaderView: UICollectionReusableView {
    
    private let carBackground: UIImageView = {
        let image = UIImage(named: "mercedes")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let odoLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        
        self.addSubview(carBackground)
        self.carBackground.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalToSuperview()
        }
       
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(25)
        }
        
        self.addSubview(odoLabel)
        odoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-5)
        }
        
    }
    
    func configure(model: Car) {
        self.nameLabel.text = "\(model.brand)  \(model.model)"
        self.odoLabel.text = "\(model.odometer) km"
    }
}

