//
//  RepositoriesViewController.swift
//  desafio-ios
//
//  Created by Lázaro Lima dos Santos on 30/11/17.
//  Copyright © 2017 Lázaro Lima dos Santos. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    
    private var mainView: RepositoriesView!
    var repositoriesRouter: RepositoriesRouter!
    private lazy var interactor: RepositoriesInteractor = RepositoriesInteractorFactory.make(presenter: mainView.presenter)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        mainView = RepositoriesView(parentView: view, delegate: self)
        title = String.NavigationTitle.repositories
        interactor.getRepositories()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(String.ViewError.error)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension RepositoriesViewController: RepositoriesViewAction {
    func selectRepository(repository: Repository) {
        repositoriesRouter.showPullRequest(with: repository)
    }
    
    func endScroll() {
        interactor.getRepositories()
    }
}
