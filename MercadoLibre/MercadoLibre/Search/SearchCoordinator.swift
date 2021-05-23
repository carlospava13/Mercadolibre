//
//  SearchCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit
protocol SearchCoordinatorDelegate: AnyObject {
    func close()
}

final class SearchCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let dependencies = SearchPresenter.InputDependencies(coordinator: self)
        let presenter = SearchPresenter(dependencies: dependencies)
        let viewController = SearchViewController()
 
        viewController.presenter = presenter
        let rootViewController = UINavigationController(rootViewController: viewController)
        rootViewController.modalTransitionStyle = .crossDissolve
        rootViewController.modalPresentationStyle = .fullScreen
        navigationController.present(rootViewController, animated: true, completion: nil)
    }

}

extension SearchCoordinator: SearchCoordinatorDelegate {
    func close() {
        navigationController.dismiss(animated: false, completion: nil)
    }
}
