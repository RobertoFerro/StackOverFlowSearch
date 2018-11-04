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
        print(body.format(with:"stackOverFlowWebPage"))
        print("<html><head><meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1'/><style type='text/css'>pre{background: #f4f4f4;border: 1px solid #ddd;border-left: 3px solid #4078C4;color: #666;page-break-inside: avoid;font-family: monospace;font-size: 13px;line-height: 1.6;margin-bottom: 1.6em;max-width: 100/%;overflow: auto;padding: 1em 1.5em;} body,p{font-family: -apple-system; font-size:13px } img{padding: 0;display: block;margin: 0 auto;max-height: 100/%;max-width: 100/%;} </style></head><body>"+body+"</body></html>")
    }
}
