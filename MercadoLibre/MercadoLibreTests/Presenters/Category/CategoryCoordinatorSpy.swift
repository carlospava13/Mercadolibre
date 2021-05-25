//
//  CategoryCoordinatorSpy.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Foundation
@testable import MercadoLibre
final class CategoryCoordinatorSpy: CategoryCoordinatorDelegate {
    var showSearchCallBack: () -> Void = {}
    var showProductCallBack: (String) -> Void = { _ in }

    func showSearch() {
        showSearchCallBack()
    }

    func showProduct(id: String) {
        showProductCallBack(id)
    }
}
