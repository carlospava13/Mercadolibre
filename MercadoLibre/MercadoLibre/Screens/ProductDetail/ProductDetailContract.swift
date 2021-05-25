//
//  ProductDetailContract.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//
import MLData
protocol ProductDetailPresentering: BasePresentering {}

protocol ProductDetailView: BaseView {
    func set(detail: ProductDetailModel)
    func set(titleDescription: String)
    func set(description: String)
}
