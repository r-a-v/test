//
//  ListCell.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class ListCell: UITableViewCell {
    
    static let reuseID = "listCell"
    
    var viewModel: ListCellViewModelProtocol! {
        didSet { updateCell() }
    }

//    MARK: - UIVIews
    private let imageViewCell = UIImageView(systemImage: "photo")
    private let titleLabel = UILabel(text: "Title", fontSize: 16)
    private let descriptionLabel = UILabel(text: "Description", fontSize: 14)
    
// MARK: - Override methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text?.removeAll()
        descriptionLabel.text?.removeAll()
        imageViewCell.image = UIImage(systemName: "photo")
    }

//    MARK: - Private methods
    private func updateCell() {
        titleLabel.text = viewModel.cellTitle
        descriptionLabel.text = viewModel.cellDescription
        guard let imageData = viewModel.imageData else { return }
        imageViewCell.image = UIImage(data: imageData)
    }
}

//MARK: - ConfigureViews
extension ListCell {
    private func configureViews() {
        [imageViewCell, titleLabel, descriptionLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [imageViewCell, titleLabel, descriptionLabel].forEach { view in
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: imageViewCell.leadingAnchor, constant: -16),
            imageViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            imageViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            imageViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            imageViewCell.widthAnchor.constraint(equalTo: imageViewCell.heightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageViewCell.leadingAnchor, constant: -16)
        ])
    }
}
