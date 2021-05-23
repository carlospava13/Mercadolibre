//
//  APIProductResultModel.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

public struct APIProductResultModel: Codable {
    public let results: [APIProductModel]
}

public struct APIProductModel: Codable {
    public var id: String
    public var title: String
    public var price: Int
    public var availableQuantity: Int
    public var permalink: String
    public var thumbnail: String
    public var condition: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case availableQuantity = "available_quantity"
        case permalink = "permalink"
        case thumbnail = "thumbnail"
        case condition = "condition"
    }
}
