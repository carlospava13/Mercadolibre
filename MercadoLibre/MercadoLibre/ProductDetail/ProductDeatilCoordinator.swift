//
//  ProductDeatilCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit

final class ProductDeatilCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController?
    private weak var rootViewController: UINavigationController?
    private weak var controller: BaseViewController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(id: String) {
        // let dependencies = CategoryPresenter.InputDependencies(coordinator: self,
        // category: category)
        let presenter = ProductDetailPresenter()
        let viewController = ProductDetailViewController()
        viewController.presenter = presenter
        controller = viewController
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didDeinit(_ coordinator: Coordinator) {
        
    }
    

    func start() {}
}
