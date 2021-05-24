//
//  SearchContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import Foundation

protocol SearchPresentering: BasePresentering, ProductDataSourceDelegate {
    func search(product: String)
    func closeSearch()
}

protocol SearchView: BaseView {
    func setEmptyState(description: String)
    func setTitle(_ text: String)
    func showTableViewWithAnimation()
    func setupProduct(data: [ProductModel])
}
