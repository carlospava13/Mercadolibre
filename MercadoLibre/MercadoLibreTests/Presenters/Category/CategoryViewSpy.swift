//
//  CategoryViewSpy.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Foundation
@testable import MercadoLibre
final class CategoryViewSpy: CategoryView {
    var setTitleCallBack: (String) -> Void = { _ in }
    var setupProductCallBack: ([ProductModel]) -> Void = { _ in }
    var showLoadingCallBack: () -> Void = {}
    var hideLoadingCallBack: () -> Void = {}

    func setTilte(_ text: String) {
        setTitleCallBack(text)
    }

    func setupProduct(data: [ProductModel]) {
        setupProductCallBack(data)
    }

    func showLoading() {
        showLoadingCallBack()
    }

    func hideLoading() {
        hideLoadingCallBack()
    }
}
