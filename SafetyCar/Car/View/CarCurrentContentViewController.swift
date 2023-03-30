//
//  CarCurrentContentViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 23/03/2023.
//

import UIKit

protocol CarCurrentContentViewControllerOutput: AnyObject {
    func didSelect(carID: String, vehicleCell: VehicleCell)
}

final class CarCurrentContentViewController: UICollectionViewController {
    
    private let dataSource: CarCurrentDataSource
    
    private weak var output: CarCurrentContentViewControllerOutput?
    
    init(dataSource: CarCurrentDataSource, output: CarCurrentContentViewControllerOutput?) {
        self.dataSource = dataSource
        self.output = output
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        self.collectionView.collectionViewLayout = self.compositionalLayout
    }
    
    override func viewDidLoad() {
        registerCells()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCells() {
        collectionView.register(CarCurrentHeaderView.self,
                                forSupplementaryViewOfKind: "header",
                                withReuseIdentifier: "CarCurrentHeaderView")
        collectionView.register(CarCurrentCollectionViewCell.self, forCellWithReuseIdentifier: "CarCurrentCollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true
    }
    
    private lazy var compositionalLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, environment) -> NSCollectionLayoutSection? in
        let sidesInset: CGFloat = 16
        let topInset: CGFloat = 12
        
        if sectionIndex == 0 {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            // Outer Group
            let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/1.4), heightDimension: .fractionalWidth(0.6))
            let outerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: outerGroupSize, subitems: [item])
            
            // Section
            let section = NSCollectionLayoutSection(group: outerGroup)
            section.orthogonalScrollingBehavior = .none
            
            let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
            section.boundarySupplementaryItems = [headerItem]
            
            return section
        } else {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .absolute(150))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: sidesInset, bottom: 0, trailing: sidesInset)
            
            // Outer Group
            let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
            let outerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: outerGroupSize, subitems: [item])
            
            // Section
            let section = NSCollectionLayoutSection(group: outerGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: topInset, leading: sidesInset, bottom: topInset, trailing: sidesInset)
            
            return section
        }
    })
}

extension CarCurrentContentViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dataSource.vehicleItems[indexPath.row]
        let carID = dataSource.car.carID
        self.output?.didSelect(carID: carID, vehicleCell: item)
   }
}
