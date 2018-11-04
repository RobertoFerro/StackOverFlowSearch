//
//  Array.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
     func toString() -> String {
        var elements = ""
        var elementsArray = self

        let lastElement = elementsArray.removeLast()
        
        for element in elementsArray {
            elements += element + ", "
        }
        
        elements += lastElement
        
        return elements
    }
}
