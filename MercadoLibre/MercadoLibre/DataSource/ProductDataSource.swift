//
//  ProductDataSource.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

protocol ProductDataSourceDelegate: AnyObject {
    func productSelected(_ product: ProductModel)
}

final class ProductDataSource: BaseTableViewDataSource<ProductModel, ProductCell> {
    weak var delegate: ProductDataSourceDelegate?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.productSelected(data[indexPath.row])
    }
}
