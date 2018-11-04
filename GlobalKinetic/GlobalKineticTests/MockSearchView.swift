//
//  MockSearchView.swift
//  GlobalKineticTests
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation


class MockSearchView: SearchView,Testable {
    
    var showSuccessInvoked = false
    var showNoPostsInvoked = false
    var showErrorInvoked = false
    
    func showSuccess() {
        showSuccessInvoked = true
    }
    
    func showNoPosts() {
        showNoPostsInvoked = true
    }
    
    func showError(_ errorMessage: String) {
        showErrorInvoked = true
    }
    
    func resetData() {
        showSuccessInvoked = false
        showNoPostsInvoked = false
        showErrorInvoked = false
    }
}
