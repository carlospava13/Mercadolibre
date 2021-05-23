//
//  ProductDetailPresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine
import MLData

final class ProductDetailPresenter: BasePresenter {
    struct InputDependencies {
        let idProduct: String
        let repository: GetProductDetailRepositoring
    }

    private var dependencies: InputDependencies

    private var ownerView: ProductDetailView! {
        view as? ProductDetailView
    }

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }

    override func viewDidLoad() {
        getProduct()
    }

    private func getProduct() {
        let id = dependencies.idProduct
        dependencies.repository.getproduct(id: id).sink { _ in

        } receiveValue: { result in
            print(result)
        }.store(in: &subscriptions)
    }
}

extension ProductDetailPresenter: ProductDetailPresentering {}
