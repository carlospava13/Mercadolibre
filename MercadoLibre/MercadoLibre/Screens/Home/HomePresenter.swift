//
//  HomePresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine
import MLData
import os

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
        ownerView.setTitle(TextML.Category.title)
        getCategories()
    }

    func getCategories() {
        ownerView.showLoading()
        let repository = GetCategoriesRepository()
        repository.getCategories().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                os_log("Some ERROR: \(error.localizedDescription)")
            case .finished:
                self?.ownerView.hideLoading()
            }
        } receiveValue: { [weak self] categories in
            self?.parse(categories: categories)
        }.store(in: &subscriptions)
    }

    private func parse(categories: [APICategoryModel]) {
        var data: [CategoryModel] = []
        categories.forEach { categoryDto in
            data.append(CategoryModel(id: categoryDto.id,
                                      title: categoryDto.name))
        }
        ownerView.setupCategory(data: data)
    }
}

extension HomePresenter: HomePresentering {
    func categorySelected(model: CategoryModel) {
        dependencies.coordinator?.showCategory(category: model)
    }
    
    func showSearch() {
        dependencies.coordinator?.showSearch()
    }
}
