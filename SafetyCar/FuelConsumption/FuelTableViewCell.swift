//
//  FuelTableViewCell.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 16/03/2023.
//

import UIKit

class FuelTableViewCell: UITableViewCell {
    
   static let identifier = "FuelTableViewCell"
    
    private let gasPicture: UIImageView = {
        let image = UIImage(named: "gas-pump.png")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        //imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "19.01.2023"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let odoLabel: UILabel = {
        let label = UILabel()
        label.text = "Odo: 165234"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let litersLabel: UILabel = {
        let label = UILabel()
        label.text = "50.35 ltr"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let distanceInKmLabel: UILabel = {
        let label = UILabel()
        label.text = "(+ 350) km"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.text = "450.50 zł"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let avgFuelConsumptionLabel: UILabel = {
        let label = UILabel()
        label.text = "7.53L"
        label.textAlignment = .left
        label.textColor = .green
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = false
        contentView.layer.cornerRadius = 10
        self.backgroundColor = UIColor(hexString: "#181a18", alpha: 1.0)
        contentView.backgroundColor = UIColor(hexString: Constants.backgroundColor, alpha: 1.0)
        contentView.addSubview(gasPicture)
        contentView.addSubview(dateLabel)
        contentView.addSubview(odoLabel)
        contentView.addSubview(litersLabel)
        contentView.addSubview(distanceInKmLabel)
        contentView.addSubview(costLabel)
        contentView.addSubview(avgFuelConsumptionLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let contentViewFrame = self.contentView.frame
           let insetContentViewFrame = contentViewFrame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
           self.contentView.frame = insetContentViewFrame
           self.selectedBackgroundView?.frame = insetContentViewFrame
        
        gasPicture.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.leading.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(gasPicture.snp.trailing).inset(-10)
            make.top.equalTo(20)
        }
       
        odoLabel.snp.makeConstraints { make in
            make.leading.equalTo(gasPicture.snp.trailing).inset(-10)
            make.top.equalTo(dateLabel.snp.bottom).inset(-20)
        }
        
        litersLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        distanceInKmLabel.snp.makeConstraints { make in
            make.top.equalTo(litersLabel.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
        }
        
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.trailing.equalTo(-30)
        }
        
        avgFuelConsumptionLabel.snp.makeConstraints { make in
            make.top.equalTo(costLabel.snp.bottom).inset(-20)
            make.trailing.equalTo(-30)
        }
    }
    
    func configure(with viewModel: String) {
        //odoLabel.text = viewModel
    }
}
