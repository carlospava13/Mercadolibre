//
//  Item.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

public struct APIItemResultModel: Codable {
    public let results: [APIItemModel]
}

public struct APIItemModel: Codable {
    public var id: String
    public var title: String
    public var price: Int
    public var availableQuantity: Int
    public var permalink: String
    public var thumbnail: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case availableQuantity = "available_quantity"
        case permalink = "permalink"
        case thumbnail = "thumbnail"
    }
}
