//
//  HomePresenter.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine
import MLData
final class HomePresenter: BasePresenter {
    private var ownerView: HomeView {
        view as! HomeView
    }

    override func viewDidLoad() {
        getCategories()
    }

    func getCategories() {
        let repository = GetCategoriesRepository()
        repository.getCategories().sink { completion in
            print(completion)
        } receiveValue: { [weak self] categories in
            self?.parse(categories: categories)
        }.store(in: &subscriptions)
    }

    private func parse(categories: [CategoryDto]) {
        var data: [CategoryModel] = []
        categories.forEach { categoryDto in
            data.append(CategoryModel(title: categoryDto.name))
        }
        ownerView.setupCategory(data: data)
    }

    private func getItems(_ item: String) {
        let respository = GetItemRepository()
        respository.getItems(item: item).sink { completion in
            print(completion)
        } receiveValue: { [weak self] result in
            self?.parse(items: result.results)
        }.store(in: &subscriptions)
    }

    private func parse(items: [APIItemModel]) {
        var data: [ItemModel] = []
        items.forEach { apiModel in
            data.append(ItemModel(
                title: apiModel.title,
                price: apiModel.price,
                condition: apiModel.condition,
                thumbnail: apiModel.thumbnail))
        }
        ownerView.setupProduct(data: data)
    }
}

extension HomePresenter: HomePresentering {
    func search(text: String) {
        getItems(text)
    }
}
