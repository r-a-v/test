//
//  PostTests.swift
//  test_QEXTests
//
//  Created by aleksandr_rudikov on 07.09.2021.
//

import XCTest
@testable import test_QEX

class PostTests: XCTestCase {
    
    var responseModel: ResponseModel!
    var post: Post!

    override func setUp()  {
        super.setUp()
        post = Post(id: 1, name: "name", photo: "photo",
                    description: "decr", createdAt: "cretaedAt",
                    updatedAt: "updatedAt")
        responseModel = ResponseModel(posts: [post])
    }

    override func tearDown() {
        post = nil
        responseModel = nil
        super.tearDown()
    }

    func testInitPost() {
        XCTAssertNotNil(post)

    }
    
    func testInitResponseModel() {
        XCTAssertNotNil(responseModel)
        XCTAssertTrue(responseModel.posts.count == 1)
    }
}
