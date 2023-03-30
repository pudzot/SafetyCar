//
//  AddCarViewController.swift
//  SafetyCar
//
//  Created by Damian Piszcz on 24/03/2023.
//

import UIKit
import TPCommon

class AddCarViewController: BaseViewController<AddCarView> {
    
    private var profileCarImage: UIImage?
    
    private let presenter: AddCarPresenterType
    
    private let imagePicker = UIImagePickerController()
    
    init(presenter: AddCarPresenterType) {
        self.presenter = presenter
        super.init()
    }
    
    override func loadView() {
        self.view = View()
        self.view.backgroundColor = .white
        
    }
    
    override func viewDidLoad() {
        self.setupView()
        self.presenter.attach(self)
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = true
        
        self.customView.didClickChangeImage = self.showImagePickerOptions
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action:  #selector(closeVC))
        navigationItem.title = "Dodaj"
    }
    
    func setupView(){
        self.customView.addButton.addTarget(self, action: #selector(didClickAddNewCar), for: .touchUpInside)
    }
    
    @objc func didClickAddNewCar() {
        guard let profileCarImage = profileCarImage,
              let brand = customView.brandTextField.text,
              let model = customView.modelTextField.text,
              let year = Int(customView.yearTextField.text!),
              let fuelType = customView.fuelTypeTextField.text,
              let odometer = customView.odometerTextField.text
        else {
            print("DEBUG: Wypełnij wszystko")
            return
        }

        let car = AddCar(brand: brand, model: model, year: year, fuelType: fuelType, odometer: odometer, profileCarImage: profileCarImage)
        
        presenter.addNewCar(model: car)
        
        self.dismiss(animated: true)
        
    }
    
    @objc func closeVC() {
        dismiss(animated: true)
    }
}

extension AddCarViewController: AddCarViewType {
    func showError() {
        print("Error")
    }
    
}

extension AddCarViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
       // let image = UpdateProfileCarImage(profileCarImage: selectedImage)
        self.profileCarImage = selectedImage
        self.customView.carProfileImage.image = selectedImage
        self.dismiss(animated: true)
    }
    
    func showImagePickerOptions() {
        let alertVC = UIAlertController(title: "Pick a Photo", message: "Choose a picture from Library or camera", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] action in
            guard let self = self else {
                return
            }
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true) {
            }
        }
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [weak self] action in
            guard let self = self else {
                return
            }
            self.present(self.imagePicker, animated: true) {
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cameraAction)
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)
        
        self.present(alertVC, animated: true)
    }
}
