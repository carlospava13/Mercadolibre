//
//  ProductDetailViewSpy.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 25/05/21.
//

import Foundation
@testable import MercadoLibre
final class ProductDetailViewSpy: ProductDetailView {
    var setDetailCallBack: (ProductDetailModel) -> Void = { _ in }
    var setTitleDescriptionCallBack: (String) -> Void = { _ in }
    var setDescriptionCallBack: (String) -> Void = { _ in }
    var showLoadingCallBack: () -> Void = {}
    var hideLoadingCallBack: () -> Void = {}

    func set(detail: ProductDetailModel) {
        setDetailCallBack(detail)
    }

    func set(titleDescription: String) {
        setTitleDescriptionCallBack(titleDescription)
    }

    func set(description: String) {
        setDescriptionCallBack(description)
    }

    func showLoading() {
        showLoadingCallBack()
    }

    func hideLoading() {
        hideLoadingCallBack()
    }
}
