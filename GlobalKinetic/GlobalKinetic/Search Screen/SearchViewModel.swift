//
//  SearchViewModel.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    let repository: SearchRepository
    var posts:[Post] = []
    var view:SearchView
    
    init(_ view:SearchView,_ repository:SearchRepository){
        self.view = view
        self.repository = repository
    }
    
    func initalizeViewForPresnetation() {
            self.view.showNoPosts()
    }
    
    func numberOfPosts() -> Int {
        return posts.count
    }
    
    func post(at index:Int) -> Post {
        return posts[index]
    }
    
    func fetchPosts(for searchTerm:String) {
        repository.fetchStackOverFlowPost(for: searchTerm, successBlock: successfullyFetchedPosts, errorBlock: failureFetchingPosts)
    }
    
    func successfullyFetchedPosts(_ posts:[Post]) {
        self.posts = posts
        self.view.showSuccess()
    }
    
    func failureFetchingPosts(_ error:Error) {
        self.view.showError( error.localizedDescription)
    }
 
}
