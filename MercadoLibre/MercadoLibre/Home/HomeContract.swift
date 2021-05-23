//
//  HomeContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

protocol HomePresentering: BasePresentering, CategoryDataSourceDelegate {
    func getCategories()
}

protocol HomeView: BaseView {
    func setTitle(_ text: String)
    func setupCategory(data: [CategoryModel])
}
