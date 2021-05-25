//
//  APIProductDetailModel.swift
//  MLData
//
//  Created by Carlos Pava on 23/05/21.
//

import Foundation

public struct APIProductDetailModel: Codable {
    public let title: String
    public let price: Int
    public let pictures: [APIProductDetailPicture]
   
    public init(title: String,
                price: Int,
                pictures: [APIProductDetailPicture]) {
        self.title = title
        self.price = price
        self.pictures = pictures
    }
}

public struct APIProductDetailPicture: Codable {
    public let secureUrl: String
    enum CodingKeys: String, CodingKey {
        case secureUrl = "secure_url"
    }
    
    public init(secureUrl: String) {
        self.secureUrl = secureUrl
    }
}
