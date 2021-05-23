//
//  GetProductByCategoryRepositoring.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

public protocol GetProductByCategoryRepositoring {
    func getProducts(categoryId: String) -> AnyPublisher<APIProductResultModel, Error>
}
