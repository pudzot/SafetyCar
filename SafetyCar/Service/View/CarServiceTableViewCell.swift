//
//  CarServiceTableViewCell.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 27/03/2023.
//

import UIKit

class CarServiceTableViewCell: UITableViewCell {
    
   static let identifier = "CarServiceTableViewCell"
    
    private let serviceImage: UIImageView = {
        let image = UIImage(named: "carService.png")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "19.01.2023"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let odometerLabel: UILabel = {
        let label = UILabel()
        label.text = "Odo: 165234"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olej + filtry"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Wymiana oleju Motul 8100 + filtr oleju xxx + filtr paliwa www"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.text = "450.50 zł"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        self.backgroundColor = .systemGray6
        contentView.backgroundColor = .white

        contentView.addSubview(serviceImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(odometerLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(costLabel)
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

        serviceImage.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.leading.equalTo(10)
            make.centerY.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(10)
        }
       
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(serviceImage.snp.trailing).inset(-20)
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.height.equalTo(15)
        }
        
        odometerLabel.snp.makeConstraints { make in
            make.leading.equalTo(serviceImage.snp.trailing).inset(-20)
            make.top.equalTo(dateLabel.snp.bottom).inset(-10)
            make.height.equalTo(15)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(odometerLabel.snp.bottom).inset(-10)
            make.leading.equalTo(serviceImage.snp.trailing).inset(-20)
            make.trailing.equalTo(contentView)
            //make.height.equalTo(30)
        }

        costLabel.snp.makeConstraints { make in
            //make.leading.equalTo(dateLabel.snp.trailing)
            make.trailing.equalTo(contentView).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.height.equalTo(15)
        } 
    }
    
    fileprivate func attributedText(withValue value: String, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value) ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSAttributedString(string: "\(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray]))
        return attributedTitle
    }

    func configure(with viewModel: CarService) {
        titleLabel.text  = viewModel.title
        dateLabel.attributedText = attributedText(withValue: "Data: ", text: viewModel.date.dateFormatter(style: .short) ?? "")
        odometerLabel.attributedText = attributedText(withValue: "Przebieg: ", text: viewModel.odometer)
        descriptionLabel.attributedText = attributedText(withValue: "Opis: ", text: viewModel.description)
        costLabel.attributedText = attributedText(withValue: "Koszt:", text: "\(viewModel.cost) zł")
    }
}

