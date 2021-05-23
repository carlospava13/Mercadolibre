//
//  EndPoint.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

public enum EndPointValue {
    static let baseUrl = "https://api.mercadolibre.com/"
    public enum Points: String {
        case sites = "sites/"
        case siteID = "MCO/"
        case search = "search?q="
        case all = "all"
        case categories = "categories"
        case category = "search?category="
        case items = "items/"
    }
}
