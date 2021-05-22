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
        return searchBar
    }()

    private lazy var homeView = HomeView()

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        let respository = GetItemRepository()
        respository.getItems().sink { completion in
            print(completion)
        } receiveValue: { [weak self] result in
            self?.parse(items: result.results)
        }.store(in: &subscriptions)
    }

    func setupSearchBar() {
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.removeLines()
    }

    func parse(items: [APIItemModel]) {
        var data: [ItemModel] = []
        items.forEach { apiModel in
            data.append(ItemModel(
                title: apiModel.title,
                price: apiModel.price,
                thumbnail: apiModel.thumbnail))
        }
        homeView.set(data: data)
    }
}

extension HomeViewController: UISearchBarDelegate {}
