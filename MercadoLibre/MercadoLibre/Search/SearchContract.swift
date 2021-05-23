//
//  SearchContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import Foundation

protocol SearchPresentering: BasePresentering {
    func search(product: String)
    func closeSearch()
}

protocol SearchView: BaseView {
    func showTableViewWithAnimation()
    func setupProduct(data: [ProductModel])
}
