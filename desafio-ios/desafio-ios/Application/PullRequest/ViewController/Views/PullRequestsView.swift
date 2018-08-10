//
//  PullRequestsView.swift
//  desafio-ios
//
//  Created by Lazaro Lima on 04/12/2017.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class PullRequestsView: UIView, PresentationView {
    
    private weak var delegate: PullRequestViewAction?
    var loadingView: LoadingView!
    var errorView: ErrorView!
    private var headerView: PullRequestsHeaderView?
    private let tableView = PullRequestTableViewFactory.make()
    var dataSource: TableDataSource<PullRequestTableViewCell, PullRequest>!
    
    lazy var presenter: PullRequestsPresenter = PullRequestsPresenterFactory.make(onLoading: {
        self.presentLoading()
    }, onPullRequestList: { pullRequests in
        self.dismissLoading()
        self.pullRequests = pullRequests
    }, onQuantityPullRequest: { openAndClosed in
         self.dismissLoading()
        self.showHeaderViewQuantity(quantityPullRequest: openAndClosed)
    }) { error in
        self.presentError(error: error)
    }
    
    private var pullRequests: [PullRequest] = [] {
        didSet {
            self.setupDataSource(pullRequests: pullRequests)
        }
    }
    
    init(parentView: UIView, delegate: PullRequestViewAction) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView(parentView: parentView)
        setupHeaderView()
        self.setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(String.ViewError.error)
    }
    
    private func setupDataSource(pullRequests: [PullRequest]) {
        DispatchQueue.main.async {
            self.dataSource = TableDataSource(items: pullRequests)
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self
            self.tableView.reloadData()
        }
    }
    
    private func setupHeaderView() {
        headerView = PullRequestsHeaderViewFactory.make(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: 60))
    }
    
    private func showHeaderViewQuantity(quantityPullRequest: String) {
        headerView?.quantityOpenClosed = quantityPullRequest
    }
}

extension PullRequestsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedPullRequest(link: pullRequests[indexPath.row].url)
    }
}

extension PullRequestsView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(tableView)
        tableView.tableHeaderView = headerView
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

