//
//  CategoryCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit
import MLData

protocol CategoryCoordinatorDelegate: AnyObject {
    func showSearch()
    func showProduct(id: String)
}

final class CategoryCoordinator: AppCoordinator {

    private weak var categoryViewController: CategoryViewController?
    
    deinit {
        parentCoordinator?.didDeinit(self)
    }
    
    func start(category: CategoryModel) {
        let dependencies = CategoryPresenter.InputDependencies(coordinator: self,
                                                               category: category,
                                                               repository: GetProductByCategoryRepository())
        let viewController = CategoryViewController()
        viewController.presenter = CategoryPresenter(dependencies: dependencies)
        navigationController.pushViewController(viewController, animated: true)
        categoryViewController = viewController
    }
}

extension CategoryCoordinator: CategoryCoordinatorDelegate {
    func showSearch() {
        let searchCoordinator = SearchCoordinator(parentCoordinator: self,
                                                  navigationController: navigationController)
        searchCoordinator.start()
    }
    
    func showProduct(id: String) {
        let productDetailCoordinator = ProductDeatilCoordinator(
            parentCoordinator: self,
            navigationController: navigationController)
        productDetailCoordinator.start(id: id)
    }
}
