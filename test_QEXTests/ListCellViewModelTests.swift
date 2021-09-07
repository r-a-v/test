//
//  ListCellViewModelTests.swift
//  test_QEXTests
//
//  Created by aleksandr_rudikov on 07.09.2021.
//

import XCTest
@testable import test_QEX

class ListCellViewModelTests: XCTestCase {
    
    var post: Post!
    var listCellViewModel: ListCellViewModel!

    override func setUp() {
        super.setUp()
        post = Post(id: 1, name: "name", photo: "photo",
                    description: "description", createdAt: "createdAt",
                    updatedAt: "updatedAt")
        listCellViewModel = ListCellViewModel(post: post)
    }

    override func tearDown() {
        post = nil
        listCellViewModel = nil
        super.tearDown()
    }

    func testInitListCellViewModel() {
        XCTAssertNotNil(listCellViewModel)
    }
    
    func testListCellViewModelProps() {
        XCTAssertTrue(listCellViewModel.cellTitle == post.name)
        XCTAssertTrue(listCellViewModel.cellDescription == post.description)
    }
}
