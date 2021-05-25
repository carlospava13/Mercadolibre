//
//  HomeCoordinatorSpy.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Foundation
@testable import MercadoLibre
final class HomeCoordinatorSpy: HomeCoordinatorDelegate {
    var showCategoryCallBack: (CategoryModel) -> Void = { _ in }
    var showSearchCallBack: () -> Void = {}

    func showCategory(category: CategoryModel) {
        showCategoryCallBack(category)
    }

    func showSearch() {
        showSearchCallBack()
    }
}
