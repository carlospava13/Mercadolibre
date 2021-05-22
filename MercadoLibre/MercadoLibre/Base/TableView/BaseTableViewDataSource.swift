//
//  BaseTableViewDataSource.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

class BaseTableViewDataSource<Data: CellObjectView, CELL: BaseTableViewCell<Data>>: NSObject, UITableViewDataSource {
    private var data: [Data] = []
    private var cellIdentifier: String
    init(cellIdentifier: CELL.Type) {
        self.cellIdentifier = String(describing: cellIdentifier)
    }

    func set(data: [Data]) {
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CELL else {
            return UITableViewCell()
        }
        cell.set(data: data[indexPath.row])
        return cell
    }
}

extension UITableView {
    func register(cell: AnyClass) {
        register(cell, forCellReuseIdentifier: String(describing:cell))
    }
}
