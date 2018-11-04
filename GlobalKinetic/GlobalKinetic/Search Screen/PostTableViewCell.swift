//
//  PostTableViewCell.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/10/31.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var askedBy: UILabel!
    @IBOutlet weak var votes: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var views: UILabel!
    @IBOutlet weak var answers: UILabel!
    @IBOutlet weak var tickImageView: UIImageView!
    
    @IBOutlet weak var tickWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var tickLeadingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeArrowImage()
        initializeTick()
        initializeTitle()
        initializeVotes()
        initializeAnswers()
        initializeAskedBy()
        initializeNumberViewsOfPost()
    }
    
    private func initializeAskedBy() {
        askedBy.textColor = StyleKit.secondaryColour()
        askedBy.font = StyleKit.regular(withFontSize: .small)
    }
    
    private func initializeArrowImage() {
        arrowImageView.image = UIImage(named:Constants.rightArrowImageName)
        arrowImageView.contentMode = .scaleToFill
    }
    
    private func initializeTick() {
        tickImageView.image = UIImage(named:Constants.tickImageName)
        tickImageView.contentMode = .center
    }
    
    private func initializeTitle() {
        title.font = StyleKit.regular(withFontSize: .large)
        title.textColor = StyleKit.primaryColour()
    }
    
    private func initializeVotes() {
        votes.font = StyleKit.regular(withFontSize: .small)
        votes.textColor = StyleKit.secondaryColour()
    }
    
    private func initializeNumberViewsOfPost() {
        views.font = StyleKit.regular(withFontSize: .small)
        views.textColor = StyleKit.secondaryColour()
    }
    
    private func initializeAnswers() {
        answers.font = StyleKit.regular(withFontSize: .small)
        answers.textColor = StyleKit.secondaryColour()
    }
    
    public func configureCell(with post:Post) {
        title.text = post.title
        askedBy.text = post.owner.displayName.format(with:"askedBy")
        votes.text = post.score.format(with:"vote")
        views.text = post.viewCount.format(with:"view")
        answers.text = post.answerCount.format(with: "answer")
        
        tickWidthConstraint.constant = post.isAnswered ? 40 : 0
        tickLeadingConstraint.constant = post.isAnswered ? 16 : 0
    
    }

    
}
