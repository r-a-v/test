//
//  ListCellViewModel.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import Foundation

protocol ListCellViewModelProtocol {
    var cellTitle: String { get }
    var cellDescription: String { get }
    var imageData: Data? { get }
    init(post: Post)
}

class ListCellViewModel: ListCellViewModelProtocol {

    var cellTitle: String {
        post.name ?? "No Title"
    }
    var cellDescription: String {
        post.description ?? "No description"
    }
    
    var imageData: Data? {
        ImageService.shared.getImage(from: post.photo)
    }
    
    private let post: Post
    
    required init(post: Post) {
        self.post = post
    }
}
