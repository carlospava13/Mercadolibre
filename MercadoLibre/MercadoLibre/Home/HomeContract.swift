//
//  HomeContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

protocol HomePresentering: BasePresentering {
    func search(text: String)
    func getCategories()
}

protocol HomeView: BaseView {
    func setupProduct(data: [ItemModel])
    func setupCategory(data: [CategoryModel])
}
