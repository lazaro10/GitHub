//
//  PullRequestsHeaderView.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class PullRequestsHeaderView: UIView {
    
    private let quantity = PullRequestQuantityLabelFactory.make()
    
    var quantityOpenClosed: String? {
        didSet {
            if quantityOpenClosed != nil {
                configureQuantityLabel(text: quantityOpenClosed!)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(String.ViewError.error)
    }
    
    private func configureQuantityLabel(text: String) {
        let range = (text as NSString).range(of: "/")
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.black, range: NSMakeRange(range.location, text.count - range.location))
        DispatchQueue.main.async {
            self.quantity.attributedText = attributedString
        }
    }
    
}

extension PullRequestsHeaderView: ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(quantity)
    }
    
    func setupConstraints() {
        quantity.topAnchor.constraint(equalTo: topAnchor).isActive = true
        quantity.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        quantity.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        quantity.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
