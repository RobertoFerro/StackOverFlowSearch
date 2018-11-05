//
//  WKWebView.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import WebKit
import Foundation

extension WKWebView {
    func loadStackOverFlowWebPage(with body:String) {
        self.loadHTMLString(body.format(with:"stackOverFlowWebPage"), baseURL: nil)
    }
}
