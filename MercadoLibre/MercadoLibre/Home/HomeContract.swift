//
//  HomeContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

protocol HomePresentering: BasePresentering, CategoryDataSourceDelegate {
    func search(text: String)
    func getCategories()
}

protocol HomeView: BaseView {
    func setupCategory()
    func setupProducts()
    func setupProduct(data: [ProductModel])
    func setupCategory(data: [CategoryModel])
}
