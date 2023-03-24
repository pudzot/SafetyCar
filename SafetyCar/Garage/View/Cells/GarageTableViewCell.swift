//
//  GarageTableViewCell.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 22/03/2023.
//

import UIKit

class GarageTableViewCell: UITableViewCell {

    static let identifier = "GarageTableViewCell"
    
    
      
    private let nameLabel: UILabel = {
          let label = UILabel()
          label.numberOfLines = 1
          return label
      }()
      
      private let imgView: UIImageView = {
          let image = UIImage(named: "mercedes")
          let imageView = UIImageView(image: image)
          imageView.contentMode = .scaleAspectFill
          imageView.layer.cornerRadius = 10
          imageView.clipsToBounds = true
          return imageView
      }()
    
    private lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#FFFFFF", alpha: 0.8)
        view.clipsToBounds = true
        return view
    }()
      
      
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          contentView.addSubview(imgView)
          contentView.addSubview(blurView)
          contentView.addSubview(nameLabel)
          contentView.clipsToBounds = true
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      override func layoutSubviews() {
          super.layoutSubviews()
          blurView.snp.makeConstraints { make in
              make.height.equalTo(50)
              make.leading.trailing.bottom.equalTo(imgView)
          }
          
          self.imgView.snp.makeConstraints { make in
              make.top.equalTo(16)
              make.leading.equalTo(16)
              make.trailing.equalTo(-16)
              make.bottom.equalToSuperview()
          }
          
          nameLabel.snp.makeConstraints { make in
              make.top.equalTo(blurView.snp.top)
              make.leading.equalTo(blurView.snp.leading)
              make.height.equalTo(20)

          }
      }
      
      func configure(with model: Car) {
          nameLabel.text = "\(model.brand) \(model.model)"
         // imgView.sd_setImage(with: viewmodel.imageURL, completed: nil)
      }

}
