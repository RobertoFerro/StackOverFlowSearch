//
//  MockSearchRepository.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

enum mockRepositoryError: Error {
    case genericError
    
    var localizedDescription: String {
        switch self {
        case .genericError: return "There was an error"
        }
    }
}

class MockSearchRepository: SearchRepository, Testable {
    
    var shouldRunSuccessBlock = false
    var fetchPostsWasInvoked = false
    
    func fetchStackOverFlowPost(for searchTerm: String, successBlock: @escaping ([Post]) -> (), errorBlock: @escaping (Error) -> ()) {
        
        fetchPostsWasInvoked = true
        
        if(shouldRunSuccessBlock) {
            let mockPosts = GenerateMockSearchData.generateMockPosts()
            successBlock(mockPosts)
        } else {
            errorBlock(mockRepositoryError.genericError)
        }
        
    }
    
    func resetData() {
        shouldRunSuccessBlock = false
        fetchPostsWasInvoked = false
    }
    
    
}
