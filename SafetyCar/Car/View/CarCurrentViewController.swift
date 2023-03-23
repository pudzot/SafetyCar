//
//  CarCurrentViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 11/03/2023.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CarCurrentViewController: UICollectionViewController, CarCurrentViewType {
    
    func display(vehicleItems: [VehicleCell], model: Car) {
        print("display CELLS: \(vehicleItems)")
        self.vehicleItems = vehicleItems
        self.car = model
        navigationItem.title = car?.model
        collectionView.reloadData()
    }
    
    var car: Car?

    var vehicleItems: [VehicleCell] = []
    
    private let presenter: CarCurrentPresenterType
    init(presenter: CarCurrentPresenterType) {
        self.presenter = presenter
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        self.collectionView.collectionViewLayout = self.compositionalLayout
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.attachView(self)
        configureCollectionView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "private-garage"), style: .done, target: self, action: #selector(didTapGarage))
        
    }
    
    
    @objc func didTapGarage() {
        presenter.presentGarage()
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    private func  configureCollectionView() {
        collectionView.register(CarCurrentHeaderView.self,
                                forSupplementaryViewOfKind: "header",
                                withReuseIdentifier: "CarCurrentHeaderView")
        collectionView.register(CarCurrentCollectionViewCell.self, forCellWithReuseIdentifier: "CarCurrentCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
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
extension CarCurrentViewController {
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return vehicleItems.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCurrentCollectionViewCell", for: indexPath) as! CarCurrentCollectionViewCell
        
                cell.configure(vehicleItem: vehicleItems[indexPath.row])
            return cell
        }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = vehicleItems[indexPath.row].elements
        let carID = car?.carID
        print(carID)
        self.presenter.open(item)
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CarCurrentHeaderView", for: indexPath) as? CarCurrentHeaderView else {
                return UICollectionReusableView()
            }
                if let car = car {
            headerView.configure(model: car)
                    }
                
            return headerView
    }
    
}



