//
//  ItemDescriptionLabel.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit
final class ItemDescriptionLabel: UILabel {
    var sizeFont: CGFloat = 15 {
        willSet {
            font = UIFont.systemFont(
                ofSize: newValue,
                weight: UIFont.Weight.semibold)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        font = UIFont.systemFont(ofSize: sizeFont, weight: UIFont.Weight.light)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
