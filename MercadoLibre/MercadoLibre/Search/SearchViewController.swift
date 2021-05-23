//
//  SearchViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class SearchViewController: BaseViewController {
    lazy var searchBar: SearchBarML = {
        let searchBar = SearchBarML()
        searchBar.placeholder = TextML.Search.placeholder
        searchBar.showsCancelButton = true
        return searchBar
    }()
    
    private var ownerPresenter: SearchPresentering {
        presenter as! SearchPresentering
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem =    UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        setupSearchBar()
    }

    private func setupSearchBar() {
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationController?.removeLines()
    }
    
    @objc func close() {
        ownerPresenter.closeSearch()
    }
}

extension SearchViewController: SearchView {
    
}
