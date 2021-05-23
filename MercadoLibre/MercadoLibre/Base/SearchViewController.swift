//
//  SearchViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

class SearchViewController: BaseViewController {
    lazy var searchBar: SearchBarML = {
        let searchBar = SearchBarML()
        searchBar.placeholder = TextML.Search.placeholder
        searchBar.showsCancelButton = true
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }

    private func setupSearchBar() {
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.removeLines()
    }
}
