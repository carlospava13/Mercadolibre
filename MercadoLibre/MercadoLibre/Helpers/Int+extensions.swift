//
//  Int+extensions.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

extension Int {
    func setCurrentMoneyFormatter() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "es_CL")
        return formatter.string(from: NSNumber(value: self))!
    }
}
