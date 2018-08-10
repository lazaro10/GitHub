//
//  RepositoriesView.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class RepositoriesView: UIView, PresentationView {

    private weak var delegate: RepositoriesViewAction?
    var loadingView: LoadingView!
    var errorView: ErrorView!
    private let tableView = RepositoryTableViewFactory.make()
    var dataSource: TableDataSource<RepositoryTableViewCell, Repository>!
    
    lazy var presenter: RepositoriesPresenter = RepositoriesPresenterFactory.make(onLoading: {
        self.presentLoading()
    }, onSuccess: { repositories in
        self.dismissLoading()
        self.repositories += repositories
    }) { error in
        self.presentError(error: error)
    }
    
    
    private var repositories: [Repository] = [] {
        didSet {
            self.setupDataSource(repositories: repositories)
        }
    }
    
    init(parentView: UIView, delegate: RepositoriesViewAction) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView(parentView: parentView)
        self.setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(String.ViewError.error)
    }

    private func setupDataSource(repositories: [Repository]) {
        DispatchQueue.main.async {
            self.dataSource = TableDataSource(items: repositories)
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self
            self.tableView.reloadData()
        }
    }
}

extension RepositoriesView: ViewConfiguration {
    func buildViewHierarchy() {
       addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension RepositoriesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectRepository(repository: self.repositories[indexPath.row])
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.endScroll()
    }
    
}


