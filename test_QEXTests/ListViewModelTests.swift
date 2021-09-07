//
//  ListViewModelTests.swift
//  test_QEXTests
//
//  Created by aleksandr_rudikov on 07.09.2021.
//

import XCTest
@testable import test_QEX

class ListViewModelTests: XCTestCase {
    
    var posts: [Post] = []
    var post: Post!
    var listViewModel: ListViewModel!
    var indexPath: IndexPath!
    

    override func setUp() {
        super.setUp()
        createPosts()
        indexPath = IndexPath(row: 1, section: 0)
        post = posts[indexPath.row]
        listViewModel = ListViewModel()
    }

    override func tearDown() {
        posts = []
        indexPath = nil
        post = nil
        listViewModel = nil
        super.tearDown()
    }
    
    func testInitListViewModel() {
        XCTAssertNotNil(listViewModel)
    }

    func testViewModelPosts() {
        listViewModel.posts = posts
        XCTAssertTrue(listViewModel.posts.count == 10)
        XCTAssertTrue(listViewModel.numberOfRows() == 10)
    }
    
    func testInitCellViewModel() {
        let cellViewModel = ListCellViewModel(post: post)
        XCTAssertNotNil(cellViewModel)
        XCTAssertTrue(cellViewModel.cellTitle == post.name)
    }
    
    func testInitDetailViewModel() {
        let listCellViewModel = ListCellViewModel(post: post)
        XCTAssertNotNil(listCellViewModel)
        XCTAssertTrue(listCellViewModel.cellTitle == post.name)
    }
}

extension ListViewModelTests {
    
    func createPosts() {
        for num in 0...9 {
            posts.append(Post(id: num,
                              name: "name\(num)",
                              photo: "photo\(num)",
                              description: "description\(num)",
                              createdAt: "createdAT\(num)",
                              updatedAt: "updatedAt\(num)"))
        }
    }
}
