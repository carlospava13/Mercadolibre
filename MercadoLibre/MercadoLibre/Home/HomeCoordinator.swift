//
//  MainCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let homePresenter = HomePresenter()
        let homeViewController = HomeViewController()
        homeViewController.presenter = homePresenter
        navigationController.pushViewController(homeViewController, animated: false)
    }
}
