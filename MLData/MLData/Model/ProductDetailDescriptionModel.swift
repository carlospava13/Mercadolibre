//
//  ProductDetailDescriptionModel.swift
//  MLData
//
//  Created by Carlos Pava on 23/05/21.
//

import Foundation

public struct APIProductDetailDescriptionModel: Codable {
    public let plainText: String
    enum CodingKeys: String, CodingKey {
        case plainText = "plain_text"
    }
}
