//
//  AppCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    weak var weakNavigationController: UINavigationController?
    
    var navigationController: UINavigationController {
        guard let navigation = weakNavigationController else {
            preconditionFailure("is required navigation controller")
        }
        return navigation
    }

    init(parentCoordinator: Coordinator?, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.weakNavigationController = navigationController
    }

    func didDeinit(_ coordinator: Coordinator) {
        debugPrint("\n Deinit Coordinator \(coordinator.self) \n")
    }

    func start() {}
}
