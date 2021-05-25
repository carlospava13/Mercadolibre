//
//  HomeViewSpy.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Foundation
@testable import MercadoLibre

final class HomeViewSpy: HomeView {
    var setTitleCallBack: (String) -> Void = { _ in }
    var setCategoriesCallBack: ([CategoryModel]) -> Void = { _ in }
    var showLoadingCallBack: () -> Void = {}
    var hideLoadingCallBack: () -> Void = {}

    func setTitle(_ text: String) {
        setTitleCallBack(text)
    }

    func setCategories(categories: [CategoryModel]) {
        setCategoriesCallBack(categories)
    }

    func showLoading() {
        showLoadingCallBack()
    }

    func hideLoading() {
        hideLoadingCallBack()
    }
}
