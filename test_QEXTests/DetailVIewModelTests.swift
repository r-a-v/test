//
//  DetailVIewModelTests.swift
//  test_QEXTests
//
//  Created by aleksandr_rudikov on 07.09.2021.
//

import XCTest
@testable import test_QEX

class DetailVIewModelTests: XCTestCase {
    
    var detailViewModel: DetailViewModel!
    var post: Post!

    override func setUp() {
        super.setUp()
        post = Post(id: 1, name: "name", photo: "photo",
                    description: "decr", createdAt: "cretaedAt",
                    updatedAt: "updatedAt")
        detailViewModel = DetailViewModel(post: post)
    }

    override func tearDown() {
        super.tearDown()
        post = nil
        detailViewModel = nil
    }

    func testInitDetailViewModel()  {
        XCTAssertNotNil(detailViewModel)
    }
    
    func testDetailVIewModelProps() {
        XCTAssertTrue(detailViewModel.titleText == post.name)
        XCTAssertTrue(detailViewModel.descriptionText == post.description)
        XCTAssertTrue(detailViewModel.createdDateText == post.createdAt)
    }
    
}
