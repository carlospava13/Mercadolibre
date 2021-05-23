//
//  CategoryContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

protocol CategoryPresentering: BasePresentering {}

protocol CategoryView: BaseView {
    func setTilte(_ text: String)
    func setupProduct(data: [ProductModel])
}
