//
//  HomeViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine
import MLData
import UIKit

final class HomeViewController: BaseViewController {
    var subscriptions = Set<AnyCancellable>()
    private lazy var searchBar: SearchBarML = {
        let searchBar = SearchBarML()
        searchBar.delegate = self
        searchBar.placeholder = TextML.Search.placeholder
        searchBar.showsCancelButton = true
        return searchBar
    }()

    private lazy var homeView = HomeView()

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        getCategories()
    }

    func setupSearchBar() {
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.removeLines()
    }

    private func getCategories() {
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
        homeView.setCategory(data: data)
    }

    private func getItems(_ item: String) {
        let respository = GetItemRepository()
        respository.getItems(item: item).sink { completion in
            print(completion)
        } receiveValue: { [weak self] result in
            self?.parse(items: result.results)
        }.store(in: &subscriptions)
    }

    func parse(items: [APIItemModel]) {
        var data: [ItemModel] = []
        items.forEach { apiModel in
            data.append(ItemModel(
                title: apiModel.title,
                price: apiModel.price,
                condition: apiModel.condition,
                thumbnail: apiModel.thumbnail))
        }
        homeView.setItem(data: data)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getItems(searchBar.text!)
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        getCategories()
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }
}
