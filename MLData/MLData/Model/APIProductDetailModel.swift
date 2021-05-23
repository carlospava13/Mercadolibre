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
    public let descriptions: [APIProductDeatilDescription]
}

public struct APIProductDetailPicture: Codable {
    public let secure_url: String
}

public struct APIProductDeatilDescription: Codable {
    public let id: String
}
