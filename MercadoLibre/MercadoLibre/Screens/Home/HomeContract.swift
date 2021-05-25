//
//  HomeContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

protocol HomePresentering: BasePresentering, CategoryDataSourceDelegate {
    func getCategories()
    func showSearch()
}

protocol HomeView: BaseView {
    func setTitle(_ text: String)
    func setCategories(categories: [CategoryModel])
}
