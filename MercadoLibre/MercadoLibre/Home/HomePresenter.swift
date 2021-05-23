//
//  HomePresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine
import MLData

final class HomePresenter: BasePresenter {
    
    struct InputDependencies {
        weak var coordinator: HomeCoordinatorDelegate?
    }
    
    private var dependencies: InputDependencies
    
    private var ownerView: HomeView {
        view as! HomeView
    }

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }

    override func viewDidLoad() {
        getCategories()
    }

    func getCategories() {
        ownerView.setupCategory()
        let repository = GetCategoriesRepository()
        repository.getCategories().sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
               print("finished")
            }
        } receiveValue: { [weak self] categories in
            self?.parse(categories: categories)
        }.store(in: &subscriptions)
    }

    private func parse(categories: [CategoryDto]) {
        var data: [CategoryModel] = []
        categories.forEach { categoryDto in
            data.append(CategoryModel(id: categoryDto.id,
                                      title: categoryDto.name))
        }
        ownerView.setupCategory(data: data)
    }

    private func getItems(_ item: String) {
        ownerView.setupProducts()

        let respository = GetProductsRepository()
        respository.getItems(item: item).sink { completion in
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

extension HomePresenter: HomePresentering {
    func categorySelected(model: CategoryModel) {
        dependencies.coordinator?.showCategory(category: model)
    }
    
    func search(text: String) {
        getItems(text)
    }
}
