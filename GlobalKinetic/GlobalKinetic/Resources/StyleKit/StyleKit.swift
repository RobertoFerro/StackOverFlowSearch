//
//  StyleKit.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation
import UIKit

class StyleKit {
    
    //Colours
    
    static func primaryColour() -> UIColor {
        return "#4078C4".hexToColor()
    }
    
    static func secondaryColour() -> UIColor {
        return "#8F8E94".hexToColor()
    }
    
    static func lightGrey() -> UIColor {
        return "#EEEEEE".hexToColor()
    }
    
    static func darkGrey() -> UIColor {
        return "#727272".hexToColor()
    }
    
    static func white() -> UIColor {
        return UIColor.white
    }
    
    
    //Fonts
    
    static func regular(withFontSize size:Size) -> UIFont {
        return UIFont.systemFont(ofSize: size.rawValue, weight: .regular)
    }
    
    static func semiBold(withFontSize size:Size) -> UIFont {
        return UIFont.systemFont(ofSize: size.rawValue, weight: .semibold)
    }
    
    static func bold(withFontSize size:Size) -> UIFont {
        return UIFont.systemFont(ofSize: size.rawValue, weight: .bold)
    }
    
}

enum Size: CGFloat {
    case small = 10.0
    case medium = 13.0
    case large = 14.0
    case extra_large = 17.0
}

