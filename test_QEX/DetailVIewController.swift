//
//  DetailVIewController.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class DetailVIewController: UIViewController {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel(text: "Title", fontSize: 32)
    private let descriptionLabel = UILabel(text: "Description", fontSize: 20)
    private let createDateLabel = UILabel(text: "Create date", fontSize: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        customizeViews()
        setupConstraints()
    }
}

extension DetailVIewController {
    private func customizeViews() {
        imageView.backgroundColor = .green
        
    }
    
    private func setupConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       descriptionLabel,
                                                       createDateLabel]
        )
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        

        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        view.addSubview(imageView)
 
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
}

//MARK: - Preview canvas
import SwiftUI

struct DetailVIewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = DetailVIewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
