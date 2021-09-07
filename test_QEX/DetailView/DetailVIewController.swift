//
//  DetailVIewController.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class DetailVIewController: UIViewController {
    
    var viewModel: DetailViewModelProtocol!
    
//    MARK: - UIVIews
    private let imageView = UIImageView(systemImage: "photo")
    private let titleLabel = UILabel(text: "Title", fontSize: 26)
    private let descriptionLabel = UILabel(text: "Description", fontSize: 14)
    private let createDateLabel = UILabel(text: "Create date", fontSize: 10)
    
//    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        setupConstraints()
        configureViews()
    }
}

//    MARK: - Constraints & ConfigureUI
extension DetailVIewController {
    
    private func setupConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       descriptionLabel,
                                                       createDateLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        view.addSubview(imageView)
 
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.bottomAnchor.constraint(equalTo: createDateLabel.bottomAnchor)
        ])
    }
    
    private func configureViews() {
        titleLabel.text = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
        createDateLabel.text = viewModel.createdDateText
        descriptionLabel.numberOfLines = 0
        
        guard let imageData = viewModel.imageData else { return }
        imageView.image = UIImage(data: imageData)
    }
}
