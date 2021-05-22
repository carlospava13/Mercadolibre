//
//  HomeViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    private lazy var searchBar: SearchBarML = {
        let searchBar = SearchBarML()
        searchBar.delegate = self
        searchBar.placeholder = "Buscar productos, marcas y mas"
        return searchBar
    }()

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }

    func setupSearchBar() {
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.removeLines()
    }
}

extension HomeViewController: UISearchBarDelegate {}
