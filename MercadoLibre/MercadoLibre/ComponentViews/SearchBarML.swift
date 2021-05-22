//
//  SearchBarML.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

final class SearchBarML: UISearchBar {
     init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        searchTextField.backgroundColor = .white
        searchTextField.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
    }
}
