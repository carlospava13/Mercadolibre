//
//  ItemAdviceLabel.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class ItemAdviceLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.bold)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .white
        backgroundColor = .adviceML
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = 3
    }
}
