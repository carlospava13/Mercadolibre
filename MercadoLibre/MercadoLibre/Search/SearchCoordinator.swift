//
//  SearchCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit
import MLData
protocol SearchCoordinatorDelegate: AnyObject {
    func close()
    func showProducDetail(id: String)
}

final class SearchCoordinator: AppCoordinator {

    private weak var searchViewController: UINavigationController?
    deinit {
        parentCoordinator?.didDeinit(self)
    }

    override func start() {
        let dependencies = SearchPresenter.InputDependencies(coordinator: self,
                                                             repository: GetProductsRepository())
        let presenter = SearchPresenter(dependencies: dependencies)
        let viewController = SearchViewController()

        viewController.presenter = presenter
        let rootViewController = UINavigationController(rootViewController: viewController)
        rootViewController.modalTransitionStyle = .crossDissolve
        rootViewController.modalPresentationStyle = .fullScreen
        navigationController.present(rootViewController,
                                     animated: true,
                                     completion: nil)
        searchViewController = rootViewController
    }
}

extension SearchCoordinator: SearchCoordinatorDelegate {
    func showProducDetail(id: String) {
        let productDetailCoordinator = ProductDeatilCoordinator(navigationController: searchViewController!)
        productDetailCoordinator.start(id: id)
    }

    func close() {
        searchViewController?.dismiss(animated: false, completion: nil)
    }
}
