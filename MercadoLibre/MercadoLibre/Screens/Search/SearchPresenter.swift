//
//  SearchPresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine
import MLData
import os

final class SearchPresenter: BasePresenter {
    struct InputDependencies {
        let coordinator: SearchCoordinatorDelegate?
        let repository: GetProductsRepositoring
    }

    private var dependencies: InputDependencies

    private var ownerView: SearchView! {
        view as? SearchView
    }

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }

    override func viewDidLoad() {
        ownerView.setTitle(TextML.Product.title)
        ownerView.setEmptyState(description: TextML.EmptyState.description)
    }

    private func getProduct(_ text: String) {
        ownerView.showTableViewWithAnimation()
        ownerView.showLoading()
        dependencies.repository.getItems(item: text).sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                os_log("Some ERROR: \(error.localizedDescription)")
            case .finished:
                self?.ownerView.hideLoading()
            }
        } receiveValue: { [weak self] result in
            self?.parse(items: result.results)
        }.store(in: &subscriptions)
    }

    private func parse(items: [APIProductModel]) {
        var data: [ProductModel] = []
        items.forEach { apiModel in
            data.append(ProductModel(
                id: apiModel.id,
                title: apiModel.title,
                price: apiModel.price,
                condition: apiModel.condition,
                thumbnail: apiModel.thumbnail))
        }
        ownerView.setupProduct(data: data)
    }
}

extension SearchPresenter: SearchPresentering {
    func productSelected(_ product: ProductModel) {
        dependencies.coordinator?.showProducDetail(id: product.id)
    }

    func search(product: String) {
        getProduct(product)
    }

    func closeSearch() {
        dependencies.coordinator?.close()
    }
}
