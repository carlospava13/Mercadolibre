//
//  ProductDeatilCoordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit
import MLData
final class ProductDeatilCoordinator: AppCoordinator {

    private weak var controller: BaseViewController?

    deinit {
        parentCoordinator?.didDeinit(self)
    }
    
    func start(id: String) {
        let dependencies = ProductDetailPresenter.InputDependencies(idProduct: id,
                                                                    repository: GetProductDetailRepository(),
                                                                    descriptionRepository: GetProductDetailDescriptionRepository())
        let presenter = ProductDetailPresenter(dependencies: dependencies)
        let viewController = ProductDetailViewController()
        viewController.presenter = presenter
        
        navigationController.pushViewController(viewController, animated: true)
        controller = viewController
    }
}
