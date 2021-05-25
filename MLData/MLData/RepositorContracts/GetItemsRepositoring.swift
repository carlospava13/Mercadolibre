//
//  GetItemsRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

public protocol GetProductsRepositoring {
    func getItems(item: String) -> AnyPublisher<APIProductResultModel, Error>
}
