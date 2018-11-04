//
//  MockPost.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

class GenerateMockSearchData {
    
    static func generateMockPosts() -> [Post] {
        
        if let filePath = Bundle.main.path(forResource: "MockData", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode(Posts.self, from: data as Data)
                return posts.items
            }
            catch {
            }
        }
        
        return []
        
    }

}
