//
//  APIProductDetailModel.swift
//  MLData
//
//  Created by Carlos Pava on 23/05/21.
//

import Foundation

public struct APIProductDetailModel: Codable {
    let title: String
    let price: Int
    let pictures: [APIProductDetailPicture]
}

struct APIProductDetailPicture: Codable {
    let secure_url: String
}
