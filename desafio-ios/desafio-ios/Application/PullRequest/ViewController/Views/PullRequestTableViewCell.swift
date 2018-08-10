//
//  PullRequestTableViewCell.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell {
    
    private let downloadImage = DownloadImageNetworkFactory.make()
    
    private let centerHelperView = PullRequestHelperViewFactory.make()
    private let title = PullRequestTitleLabelFactory.make()
    private let desc = PullRequestDescriptionLabelFactory.make()
    private let picture = PullRequestUserPictureViewFactory.make()
    private let userName = PullRequestNameLabelFactory.make()
    
    fileprivate var pullRequest: PullRequest? {
        didSet {
            setupViewConfiguration()
            title.text = pullRequest?.title
            desc.text = pullRequest?.description
            downloadImage.download(url: URL(string: (pullRequest?.user.picture)!)!) {(image) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.picture.image = image
                    }
                }
            }
            userName.text = pullRequest?.user.userName
        }
    }
    
    override func layoutSubviews() {
        picture.layoutIfNeeded()
        picture.layer.cornerRadius = picture.frame.height/2
    }
}

extension PullRequestTableViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        contentView.addSubview(centerHelperView)
        centerHelperView.addSubview(title)
        centerHelperView.addSubview(desc)
        centerHelperView.addSubview(picture)
        centerHelperView.addSubview(userName)
    }
    
    func setupConstraints() {
        let space: CGFloat = 10.0
        
        centerHelperView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: space).isActive = true
        centerHelperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -space).isActive = true
        centerHelperView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: space).isActive = true
        centerHelperView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -space).isActive = true
        
        title.topAnchor.constraint(equalTo: centerHelperView.topAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: centerHelperView.leftAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: centerHelperView.rightAnchor).isActive = true
        title.heightAnchor.constraint(equalTo: centerHelperView.heightAnchor, multiplier: 0.3).isActive = true
        
        desc.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        desc.leftAnchor.constraint(equalTo: centerHelperView.leftAnchor).isActive = true
        desc.rightAnchor.constraint(equalTo: centerHelperView.rightAnchor).isActive = true
        desc.heightAnchor.constraint(equalTo: centerHelperView.heightAnchor, multiplier: 0.4).isActive = true
        
        picture.topAnchor.constraint(equalTo: desc.bottomAnchor).isActive = true
        picture.leftAnchor.constraint(equalTo: centerHelperView.leftAnchor).isActive = true
        picture.heightAnchor.constraint(equalTo: centerHelperView.heightAnchor, multiplier: 0.3).isActive = true
        picture.widthAnchor.constraint(equalTo: centerHelperView.heightAnchor, multiplier: 0.3).isActive = true
        
        userName.centerYAnchor.constraint(equalTo: picture.centerYAnchor).isActive = true
        userName.leftAnchor.constraint(equalTo: picture.rightAnchor, constant: space).isActive = true
        userName.widthAnchor.constraint(equalTo: centerHelperView.widthAnchor, multiplier: 0.5).isActive = true
        userName.heightAnchor.constraint(equalTo: centerHelperView.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func configureViews() {
        selectionStyle = .none
    }
}

extension PullRequestTableViewCell: ViewCellHandler {
    typealias Item = PullRequest
    
    var data: Item? {
        get {
            return pullRequest
        }
        set {
            pullRequest = newValue
        }
    }
}
