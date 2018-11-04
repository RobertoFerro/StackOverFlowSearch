//
//  Constants.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

struct Constants {
    
    //Constants in Search Screen
    static let postCellNibName = "PostTableViewCell"
    static let postCellIdentifier = "postCellIdentifier"
    static let cellHeight = 80.0
    static let numberOfRows = 1
    static let spacingBetweenCellHeight = 10.0
    
    //Constants in Post Cell
    static let rightArrowImageName = "keyboard-right-arrow-button"
    static let tickImageName = "tick"
    
    //Constants for Element Properties
    static let borderColour = "#9B9A9C".hexToColor()
    static let borderThickness = 1.0
    
    //Constants for Networking
    static let jsonApplication = "application/json"
    static let contentType =  "Content-Type"
}
