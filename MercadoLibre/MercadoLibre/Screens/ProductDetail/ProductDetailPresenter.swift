//
//  ProductDetailPresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine
import MLData
import os

final class ProductDetailPresenter: BasePresenter {
    struct InputDependencies {
        let idProduct: String
        let repository: GetProductDetailRepositoring
        let descriptionRepository: GetProductDetailDescriptionRepositoring
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
        getProductDescription()
        ownerView.set(titleDescription: TextML.ProducDetail.descriptionTitle)
    }

    private func getProduct() {
        let id = dependencies.idProduct
        dependencies.repository.getproduct(id: id).sink { completion in
            switch completion {
            case .failure(let error):
                os_log("Some ERROR: \(error.localizedDescription)")
            case .finished:
                print("finished")
            }
        } receiveValue: { [weak self] result in
            self?.parse(detail: result)
        }.store(in: &subscriptions)
    }

    private func getProductDescription() {
        let id = dependencies.idProduct
        dependencies.descriptionRepository.getproduct(id: id).sink { completion in
            switch completion {
            case .failure(let error):
                os_log("Some ERROR: \(error.localizedDescription)")
            case .finished:
                print("finished")
            }
        } receiveValue: { [weak self] description in
            guard let text = description.first?.plainText else {
                return
            }
            self?.ownerView.set(description: text)
        }.store(in: &subscriptions)
    }

    private func parse(detail: APIProductDetailModel) {
        ownerView.set(detail: detail)
    }
}

extension ProductDetailPresenter: ProductDetailPresentering {}
