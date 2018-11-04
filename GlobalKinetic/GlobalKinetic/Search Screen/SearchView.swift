//
//  SearchView.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

protocol SearchView {
    func showSuccess()
    func showNoPosts()
    func showError(_ errorMessage:String)
}
