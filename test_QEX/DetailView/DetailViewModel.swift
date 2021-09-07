//
//  DetailViewModel.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import Foundation

protocol DetailViewModelProtocol {
    var titleText: String { get }
    var descriptionText: String { get }
    var createdDateText: String { get }
    var imageData: Data? { get }
    init(post: Post)
}

class DetailViewModel: DetailViewModelProtocol {

    var titleText: String {
        post.name ?? "No title"
    }
    
    var descriptionText: String {
        post.description ?? "No description"
    }
    
    var createdDateText: String {
        post.createdAt ?? "No date"
    }
    
    var imageData: Data? {
        ImageService.shared.getImage(from: post.photo)
    }
    
    private let post: Post
    
    required init(post: Post) {
        self.post = post
    }
}
