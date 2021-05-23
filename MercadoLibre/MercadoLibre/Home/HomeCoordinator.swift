//
//  MainCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func showCategory(category: CategoryModel)
}

final class HomeCoordinator: AppCoordinator {

    override func start() {
        let dependencies = HomePresenter.InputDependencies(coordinator: self)
        let homePresenter = HomePresenter(dependencies: dependencies)
        let homeViewController = HomeViewController()
        homeViewController.presenter = homePresenter
        navigationController.pushViewController(homeViewController, animated: false)
    }

    private func categoryCoordinator(category: CategoryModel) {
        let categoryCoordinator = CategoryCoordinator(parentCoordinator: self,
                                                      navigationController: navigationController)
        categoryCoordinator.start(category: category)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {    
    func showCategory(category: CategoryModel) {
        categoryCoordinator(category: category)
    }
}
