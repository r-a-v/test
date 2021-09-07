//
//  ListViewModel.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import Foundation

protocol ListViewModelProtocol {
    var posts: [Post] { get }
    func getPosts(completion: @escaping (Bool) -> Void) throws
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> ListCellViewModelProtocol
    func detailViewModel(at indexPath: IndexPath) -> DetailViewModelProtocol
}

class ListViewModel: ListViewModelProtocol {
    var posts: [Post] = []

    func numberOfRows() -> Int {
        posts.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ListCellViewModelProtocol {
        let post = posts[indexPath.row]
        return ListCellViewModel(post: post)
    }
    
    func detailViewModel(at indexPath: IndexPath) -> DetailViewModelProtocol {
        let post = posts[indexPath.row]
        return DetailViewModel(post: post)
    }
    
    func getPosts(completion: @escaping (Bool) -> Void) {
        NetworkService.shared.getPosts { result in
            switch result {
            case .success(let responseModel):
                self.posts = responseModel.posts
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
