//
//  CategoryCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

protocol CategoryCoordinatorDelegate: AnyObject {
    func showSearch()
}

final class CategoryCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(category: CategoryModel) {
        let dependencies = CategoryPresenter.InputDependencies(coordinator: self,
                                                               category: category)
        let presenter = CategoryPresenter(dependencies: dependencies)
        let viewController = CategoryViewController()
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension CategoryCoordinator: CategoryCoordinatorDelegate {
    func showSearch() {
        SearchCoordinator(navigationController: navigationController).start()
    }
}
