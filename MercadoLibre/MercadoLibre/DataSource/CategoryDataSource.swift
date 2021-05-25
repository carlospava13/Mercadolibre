//
//  CategoryDataSource.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

protocol CategoryDataSourceDelegate: AnyObject {
    func categorySelected(model: CategoryModel)
}

final class CategoryDataSource: BaseTableViewDataSource<CategoryModel, CategotyCell> {
    weak var delegate: CategoryDataSourceDelegate?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.categorySelected(model: data[indexPath.row])
    }
}
