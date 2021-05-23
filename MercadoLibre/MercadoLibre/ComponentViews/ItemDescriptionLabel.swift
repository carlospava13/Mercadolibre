//
//  ItemDescriptionLabel.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit
final class ItemDescriptionLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
