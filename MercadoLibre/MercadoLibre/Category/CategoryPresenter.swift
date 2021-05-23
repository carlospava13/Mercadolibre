//
//  CategoryPresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import MLData

final class CategoryPresenter: BasePresenter {
    struct InputDependencies {
        let category: CategoryModel
    }

    private var dependencies: InputDependencies
    private var ownerView: CategoryView {
        view as! CategoryView
    }

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }

    override func viewDidLoad() {
        ownerView.setTilte(dependencies.category.title)
        getProducts()
    }

    private func getProducts() {
        let repository = GetProductByCategoryRepository()
        repository.getProducts(categoryId: dependencies.category.id).sink { _ in

        } receiveValue: { [weak self] apiProducts in
            self?.parse(items: apiProducts.results)
        }.store(in: &subscriptions)
    }

    private func parse(items: [APIProductModel]) {
        var data: [ProductModel] = []
        items.forEach { apiModel in
            data.append(ProductModel(
                title: apiModel.title,
                price: apiModel.price,
                condition: apiModel.condition,
                thumbnail: apiModel.thumbnail))
        }
        ownerView.setupProduct(data: data)
    }
}

extension CategoryPresenter: CategoryPresentering {}
