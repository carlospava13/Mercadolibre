//
//  BaseTableViewCell.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit
protocol CellObjectView {}

class BaseTableViewCell<T: CellObjectView>: UITableViewCell {
    /// this method must be implement to set data
    func set(data: T) {}
}
