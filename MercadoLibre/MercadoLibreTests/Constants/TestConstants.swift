//
//  TestConstants.swift
//  MercadoLibreTests
//
//  Created by Carlos Pava on 24/05/21.
//

import Foundation
import MLData
struct TestConstants {
    static let categories: [APICategoryModel] = [
        APICategoryModel(
            id: "MCO1747",
            name: "Accesorios para Vehículos"),
        APICategoryModel(
            id: "MCO441917",
            name: "Agro")
    ]
    
    static let productResult: APIProductResultModel = APIProductResultModel(results: products)

    static let products: [APIProductModel] = [
        APIProductModel(id: "MCO613152008",
                        title: "iPhone 11 128 Gb (product)red",
                        price: 2879900,
                        availableQuantity: 1,
                        permalink: "https://www.mercadolibre.com.co/iphone-11-128-gb-productred/p/MCO15149572",
                        thumbnail: "http://http2.mlstatic.com/D_639318-MLA44514977809_012021-I.jpg",
                        condition: "new")
    ]
}
