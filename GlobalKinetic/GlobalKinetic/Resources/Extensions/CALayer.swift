//
//  CALayer.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case .top:
            border.frame = CGRect(x:0, y:0, width:self.frame.width, height:thickness)
            break
        case .bottom:
            border.frame = CGRect(x:0, y:self.frame.height - thickness, width:self.frame.width, height:thickness)
            break
        case .left:
            border.frame = CGRect(x:0, y:0, width:thickness, height:self.frame.height)
            break
        case .right:
            border.frame = CGRect(x:self.frame.width - thickness, y:0, width:thickness, height:self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        addSublayer(border)
    }
}
