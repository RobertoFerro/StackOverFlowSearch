//
//  HttpClient.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidDataFailure
    case responseFailure
    case jsonDecodingFailure
    
    var localizedDescription: String {
        switch self {
            case .invalidDataFailure: return "invalidDataFailure".localized()
            case .responseFailure: return "responseFailure".localized()
            case .jsonDecodingFailure: return "jsonDecodingFailure".localized()
        }
    }
}

class HttpClient {
    
    func makeAsynchronousGetServiceCall<T:Decodable>(with networkRequest:NetworkRequest<T>) {
        
        let request = createUrlRequest(with: networkRequest.url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            if(error != nil){
                networkRequest.errorCallBack(NetworkError.responseFailure)
                return
            }
            
            guard let responseData = data else {
                networkRequest.errorCallBack(NetworkError.invalidDataFailure)
                return
            }
        
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(networkRequest.model.self, from: responseData)
                networkRequest.successCallback(decodedData)
            } catch {
                networkRequest.errorCallBack(NetworkError.jsonDecodingFailure)
                return
            }
        })
        
        task.resume()
    }
    
    private func createUrlRequest(with url:URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue(Constants.jsonApplication, forHTTPHeaderField:Constants.contentType)
        return request
    }
    
}
