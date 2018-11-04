//
//  SearchRepository.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

enum repositoryError: Error {
    case urlParsingFailure
    
    var localizedDescription: String {
        switch self {
            case .urlParsingFailure: return "urlParsingFailure".localized()
        }
    }
}

class SearchRepositoryImplementation: SearchRepository {
    
    let httpClient = HttpClient()
    
     func fetchStackOverFlowPost(for searchTerm:String, successBlock:@escaping ([Post])->(),errorBlock:@escaping (Error)->()){
        
        guard let url = URL(string: searchTerm.format(with: "stackOverFlowUrl")) else {
            DispatchQueue.main.async {
                errorBlock(repositoryError.urlParsingFailure)
            }
            return
        }
        
        let networkRequest = NetworkRequest(url, model:Posts.self, successCallback: { (posts) in
            DispatchQueue.main.async {
                successBlock(posts.items)
            }
        }, errorCallBack: { error in
            DispatchQueue.main.async {
                errorBlock(error)
            }
        })

        httpClient.makeAsynchronousGetServiceCall(with:networkRequest)
    
    }

    
}
