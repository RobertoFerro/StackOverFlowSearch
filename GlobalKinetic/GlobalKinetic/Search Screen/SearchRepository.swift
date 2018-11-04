//
//  SearchRepository.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

protocol SearchRepository {
    func fetchStackOverFlowPost(for searchTerm:String, successBlock:@escaping ([Post])->(),errorBlock:@escaping (Error)->())
}
