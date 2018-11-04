//
//  GlobalKineticTests.swift
//  GlobalKineticTests
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import XCTest

class SearchViewModelTests: XCTestCase {
    
    let mockView = MockSearchView()
    let mockRepository = MockSearchRepository()
    var viewModelUnderTest:SearchViewModel?
    
    override func setUp() {
        super.setUp()
        viewModelUnderTest = SearchViewModel(mockView,mockRepository)
    }
    
    override func tearDown() {
        mockView.resetData()
        mockRepository.resetData()
        super.tearDown()
    }
    
    func testThatTheRepositoryIsUsedToFetchPosts() {
        mockRepository.shouldRunSuccessBlock = true
        viewModelUnderTest?.fetchPosts(for: "Swift")
        XCTAssertTrue(mockRepository.fetchPostsWasInvoked)
    }
    
    func testTheViewShowsSuccessWhenTheRepositoryServiceCallIsSuccessful() {
        mockRepository.shouldRunSuccessBlock = true
        viewModelUnderTest?.fetchPosts(for: "Swift")
        XCTAssertTrue(mockView.showSuccessInvoked)
        XCTAssertFalse(mockView.showErrorInvoked)
    }
    
    func testThatTheViewShowsAnErrorWhenTheRepositoryServiceCallFails() {
        mockRepository.shouldRunSuccessBlock = false
        viewModelUnderTest?.fetchPosts(for: "Swift")
        XCTAssertFalse(mockView.showSuccessInvoked)
        XCTAssertTrue(mockView.showErrorInvoked)
    }
    
    func testThatTheViewModelPersistsPostsCountWhenTheRepositoryServiceCallIsSuccessful() {
        mockRepository.shouldRunSuccessBlock = true
        viewModelUnderTest?.fetchPosts(for: "Swift")
        XCTAssertTrue(viewModelUnderTest?.numberOfPosts() == 1)
    }
    
    func testThatTheViewModelPersistsPostsWhenTheRepositoryServiceCallIsSuccessful() {
        mockRepository.shouldRunSuccessBlock = true
        viewModelUnderTest?.fetchPosts(for: "Swift")
        XCTAssertTrue(viewModelUnderTest?.post(at: 0) != nil)
    }
    
    func testThatTheNoPostsViewIsShownWhenInitializingTheSearchView() {
        viewModelUnderTest?.initalizeViewForPresnetation()
        XCTAssertTrue(mockView.showNoPostsInvoked)
    }
}
