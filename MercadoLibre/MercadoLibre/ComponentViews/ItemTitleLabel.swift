//
//  ItemTitleLabel.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class ItemTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        textColor = .gray
    }
}
