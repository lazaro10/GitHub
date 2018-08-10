//
//  RepositoryTableViewCell.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    private let downloadImage = DownloadImageNetworkFactory.make()
    
    private let name = RepositoryNameLabelFactory.make()
    private let desc = RepositoryDescriptionLabelFactory.make()
    private let fork = RepositoryIconImageViewFactory.make(imageName: "fork")
    private let numberForks = RepositoryOrangeLabelFactory.make()
    private let star = RepositoryIconImageViewFactory.make(imageName: "star")
    private let numberStars = RepositoryOrangeLabelFactory.make()
    private let picture = RepositoryOwnerPictureImageViewFactory.make()
    private let ownerName = RepositoryOwnerNameLabelFactory.make()
    private let leftHelperView = RepositoryHelpViewFactory.make()
    private let rightHelperView = RepositoryHelpViewFactory.make()
    
    fileprivate var repository: Repository? {
        didSet {
            setupViewConfiguration()
            name.text = repository?.name
            desc.text = repository?.description
            
            if let numberForks = repository?.numberForks {
                 self.numberForks.text = "\(numberForks)"
            }
            
            if let numberStars = repository?.numberStars {
                self.numberStars.text = "\(numberStars)"
            }
            ownerName.text = repository?.owner.name

            downloadImage.download(url: URL(string: (repository?.owner.picture)!)!) {(image) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.picture.image = image
                    }
                }
            }
        }
    }
    
    override func layoutSubviews() {
        picture.layoutIfNeeded()
        picture.layer.cornerRadius = picture.frame.height/2
    }

}

extension RepositoryTableViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        contentView.addSubview(leftHelperView)
        contentView.addSubview(rightHelperView)
        leftHelperView.addSubview(name)
        leftHelperView.addSubview(desc)
        leftHelperView.addSubview(fork)
        leftHelperView.addSubview(numberForks)
        leftHelperView.addSubview(star)
        leftHelperView.addSubview(numberStars)
        rightHelperView.addSubview(picture)
        rightHelperView.addSubview(ownerName)
    }
    
    func setupConstraints() {
        let space: CGFloat = 10.0

        leftHelperView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: space).isActive = true
        leftHelperView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: space).isActive = true
        leftHelperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -space).isActive = true
        leftHelperView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        
        rightHelperView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: space).isActive = true
        rightHelperView.leftAnchor.constraint(equalTo: leftHelperView.rightAnchor).isActive = true
        rightHelperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -space).isActive = true
        rightHelperView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -space).isActive = true
        
        name.topAnchor.constraint(lessThanOrEqualTo: leftHelperView.topAnchor).isActive = true
        name.leftAnchor.constraint(equalTo: leftHelperView.leftAnchor).isActive = true
        name.heightAnchor.constraint(equalTo: leftHelperView.heightAnchor, multiplier: 0.2).isActive = true
        name.widthAnchor.constraint(equalTo: leftHelperView.widthAnchor).isActive = true

        desc.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        desc.leftAnchor.constraint(equalTo: leftHelperView.leftAnchor).isActive = true
        desc.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        desc.widthAnchor.constraint(equalTo: leftHelperView.widthAnchor).isActive = true

        fork.topAnchor.constraint(equalTo: desc.bottomAnchor).isActive = true
        fork.leftAnchor.constraint(equalTo: leftHelperView.leftAnchor).isActive = true
        fork.heightAnchor.constraint(equalTo: leftHelperView.heightAnchor, multiplier: 0.2).isActive = true
        fork.widthAnchor.constraint(equalTo: leftHelperView.heightAnchor, multiplier: 0.2).isActive = true
        
        numberForks.leftAnchor.constraint(equalTo: fork.rightAnchor).isActive = true
        numberForks.centerYAnchor.constraint(equalTo: fork.centerYAnchor).isActive = true
        numberForks.heightAnchor.constraint(equalTo: leftHelperView.heightAnchor, multiplier: 0.2).isActive = true
        numberForks.widthAnchor.constraint(equalTo: leftHelperView.widthAnchor, multiplier: 0.2).isActive = true

        star.topAnchor.constraint(equalTo: desc.bottomAnchor).isActive = true
        star.leftAnchor.constraint(equalTo: numberForks.rightAnchor).isActive = true
        star.heightAnchor.constraint(equalTo: leftHelperView.heightAnchor, multiplier: 0.2).isActive = true
        star.widthAnchor.constraint(equalTo: leftHelperView.heightAnchor, multiplier: 0.2).isActive = true
        
        numberStars.leftAnchor.constraint(equalTo: star.rightAnchor, constant: 5).isActive = true
        numberStars.centerYAnchor.constraint(equalTo: star.centerYAnchor).isActive = true
        numberStars.heightAnchor.constraint(equalTo: leftHelperView.heightAnchor, multiplier: 0.2).isActive = true
        numberStars.widthAnchor.constraint(equalTo: leftHelperView.widthAnchor, multiplier: 0.3).isActive = true
        
        picture.topAnchor.constraint(lessThanOrEqualTo: rightHelperView.topAnchor).isActive = true
        picture.heightAnchor.constraint(equalTo: rightHelperView.heightAnchor, multiplier: 0.5).isActive = true
        picture.widthAnchor.constraint(equalTo: rightHelperView.heightAnchor, multiplier: 0.5).isActive = true
        picture.centerXAnchor.constraint(equalTo: rightHelperView.centerXAnchor).isActive = true

        ownerName.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: space).isActive = true
        ownerName.centerXAnchor.constraint(equalTo: picture.centerXAnchor).isActive = true
        ownerName.heightAnchor.constraint(equalTo: rightHelperView.heightAnchor, multiplier: 0.2).isActive = true
        ownerName.widthAnchor.constraint(equalTo: rightHelperView.widthAnchor).isActive = true
    }
    
    func configureViews() {
        selectionStyle = .none
    }
}

extension RepositoryTableViewCell: ViewCellHandler {
    
    typealias Item = Repository
    
    var data: Item? {
        get {
            return repository
        }
        set {
            repository = newValue
        }
    }
    
}
