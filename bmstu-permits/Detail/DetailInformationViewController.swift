//
//  DetailInformationViewController.swift
//  yourProjectName
//
//  Created by Olga on 01.01.2024.
//

import UIKit

class DetailInformationViewController: UIViewController {
    private let titleLabel: UILabel = UILabel()
    private let locationLabel: UILabel = UILabel()
    private let scheduleLabel: UILabel = UILabel()
    private let photoImageView = CustomImageView()
    private let detailInformatioModel = DetailInformatioModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        [
            photoImageView,
            titleLabel,
            locationLabel,
            scheduleLabel,
        ]
            .forEach {
                view.addSubview($0)
            }
        
        setVisualAppearance()
        setupImage()
        setTitleLabel()
        setLocationLabel()
        setScheduleLabel()
    }
}

//MARK: - methods
extension DetailInformationViewController {
    func datailConfigure(with id: Int) {
        loadData(with: id)
    }
}

//MARK: - private methods
private extension DetailInformationViewController {
    func loadData(with id: Int) {
        detailInformatioModel.loadDetailInformation(with: id) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let building):
                DispatchQueue.main.async {
                    self.titleLabel.text = building.name
                    self.locationLabel.text = "Адрес: \(building.location)"
                    self.scheduleLabel.text = "Открыто с \(building.open_hours) до \(building.close_hours)"
                    
                    let imageUrl = "http://172.20.10.2:8000/api/buildings/\(building.id)/image/"
                    print("=================== " + imageUrl)
                    guard let photoUrl = URL(string: imageUrl) else {
                        return
                    }
                    
                    self.photoImageView.loadImage(with: photoUrl)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func setVisualAppearance() {
        photoImageView.contentMode = .scaleAspectFit // обрезаем фото
        photoImageView.clipsToBounds = true
        [titleLabel].forEach {
            $0.numberOfLines = 0
            $0.font = UIFont(name: "Roboto", size: 20) // меняем шрифт
        }
    }
    
    func setupImage() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 15).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        titleLabel.sizeToFit()
    }
    
    func setLocationLabel() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        locationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        locationLabel.sizeToFit()
    }
    
    func setScheduleLabel() {
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10).isActive = true
        scheduleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        scheduleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        scheduleLabel.sizeToFit()
    }
}
