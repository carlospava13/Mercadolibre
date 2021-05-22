//
//  GetItemsRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

public protocol GetItemsRepositoring {
    func getItems(item: String) -> AnyPublisher<APIItemResultModel, Error>
}
