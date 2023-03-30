//
//  CarCurrentCollectionViewCell.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 12/03/2023.
//

import UIKit

final class CarCurrentCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "mercedes")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var lockImageView: UIImageView = {
        let image = UIImage(named: "lock")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    private var blueEffectView: UIVisualEffectView?
    
    let vehicleTitle: UILabel = {
        let label = UILabel()
        label.text = "Vehicle Access"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        self.imageView.clipsToBounds = true
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 5
        self.imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        self.imageView.layer.borderWidth = 0.5
        
        self.addSubview(vehicleTitle)
        self.addSubview(imageView)
        self.addSubview(blurView)
        self.addSubview(lockImageView)
        
        lockImageView.snp.makeConstraints { make in
            make.height.width.equalTo(35)
            make.center.equalTo(imageView)
        }
        
        blurView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(imageView)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        vehicleTitle.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
        }
    
    }
    
    func configure(vehicleItem: VehicleCell) {
        self.vehicleTitle.text = vehicleItem.elements.title
        self.imageView.image = UIImage(named: vehicleItem.image!)
    }
}
