//
//  SearchPresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine
import MLData

final class SearchPresenter: BasePresenter {
    struct InputDependencies {
         var coordinator: SearchCoordinatorDelegate?
    }
    
    private var dependencies: InputDependencies
    
    private var ownerView: SearchView {
        view as! SearchView
    }

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
    
    private func getProduct(_ text: String) {
        ownerView.showTableViewWithAnimation()
        let respository = GetProductsRepository()
        respository.getItems(item: text).sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("finished")
            }
        } receiveValue: { [weak self] result in
            self?.parse(items: result.results)
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

extension SearchPresenter: SearchPresentering {
    
    func search(product: String) {
        getProduct(product)
    }
    
    func closeSearch() {
        dependencies.coordinator?.close()
    }
}
