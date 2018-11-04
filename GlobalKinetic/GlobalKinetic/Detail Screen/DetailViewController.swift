//
//  DetailViewController.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/01.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var postTitleContainerView: UIView!
    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var postBody: WKWebView!
    
    @IBOutlet weak var postTagContainer: UIView!
    @IBOutlet weak var postTags: UILabel!
    
    @IBOutlet weak var askedByContainer: UIView!
    @IBOutlet weak var askedByImageView: UIImageView!
    @IBOutlet weak var askedByPoints: UILabel!
    @IBOutlet weak var askedByOn: UILabel!
    @IBOutlet weak var askedByName: UILabel!
    
    let post:Post
    
    init(_ post:Post){
        self.post = post
        super.init(nibName:String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTitleView()
        initalizeTagsView()
        initializeBodyView()
        initializeAskedByView()
        initializeNavigationBar()
    }
    
    private func initializeTitleView() {
        postTitleContainerView.backgroundColor = StyleKit.lightGrey()
        postTitle.font = StyleKit.semiBold(withFontSize: .large)
        postTitle.textColor = StyleKit.darkGrey()
        postTitle.text = post.title
    }
    
    private func initalizeTagsView() {
        postTagContainer.backgroundColor = StyleKit.white()
        postTags.font = StyleKit.bold(withFontSize: .small)
        postTags.textColor = StyleKit.darkGrey()
        postTags.text = post.tags.toString()
    }
    
    private func initializeBodyView() {
        postBody.loadStackOverFlowWebPage(with: post.body)
    }
    
    private func initializeAskedByView() {
        
        askedByContainer.backgroundColor = StyleKit.lightGrey()
        askedByName.font = StyleKit.regular(withFontSize: .small)
        askedByName.textColor = StyleKit.darkGrey()
        askedByName.text = post.owner.displayName
        
        askedByPoints.font = StyleKit.bold(withFontSize: .small)
        askedByPoints.textColor = StyleKit.darkGrey()
        askedByPoints.text = post.owner.reputation?.toString()
        
        askedByOn.font = StyleKit.regular(withFontSize: .small)
        askedByOn.textColor = StyleKit.darkGrey()
        askedByOn.text = post.creationDate.formateForAskedByDate()
        
        askedByImageView.imageFromServerURL(post.owner.profileImage ?? "", placeHolder: nil)
    }
    
    private func initializeNavigationBar() {
        self.title = "detailNavigatioBarTitle".localized()
        self.navigationController?.navigationBar.tintColor = StyleKit.white()
        let textAttributes = [NSAttributedStringKey.foregroundColor:StyleKit.white()] as [NSAttributedStringKey : Any]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        postTagContainer.layer.addBorder(edge: .top, color: Constants.borderColour, thickness: CGFloat(Constants.borderThickness))
        postTagContainer.layer.addBorder(edge: .bottom, color: Constants.borderColour, thickness: CGFloat(Constants.borderThickness))
        postTitleContainerView.layer.addBorder(edge: .bottom, color: Constants.borderColour, thickness: CGFloat(Constants.borderThickness))
    }
    


}
