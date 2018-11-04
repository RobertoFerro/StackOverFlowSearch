//
//  NeworkRequest.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

typealias T = Decodable

class NetworkRequest<T> {
    let url:URL
    let model:T.Type
    let successCallback:(T)->()
    let errorCallBack:(Error)->()
    
    init(_ url:URL, model:T.Type, successCallback:@escaping (T)->(), errorCallBack: @escaping (Error)->()) {
        self.url = url
        self.model = model
        self.successCallback = successCallback
        self.errorCallBack = errorCallBack
    }
}
