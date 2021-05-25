//
//  ProductDetailViewController.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import MLData
import UIKit
final class ProductDetailViewController: BaseViewController {
    private lazy var productDetailViewer = ProductDetailViewer()

    override func loadView() {
        view = productDetailViewer
    }
}

extension ProductDetailViewController: ProductDetailView {
    func set(detail: ProductDetailModel) {
        productDetailViewer.set(detail: detail)
    }
    
    func set(titleDescription: String) {
        productDetailViewer.set(titleDescription: titleDescription)
    }
    
    func set(description: String) {
        productDetailViewer.set(description: description)
    }
}
