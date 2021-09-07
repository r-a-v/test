//
//  Post.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import Foundation

struct ResponseModel: Codable {
    let posts: [Post]
}

struct Post: Codable {
    let id: Int?
    let name: String?
    let photo: String?
    let description: String?
    let createdAt: String?
    let updatedAt: String?
}
