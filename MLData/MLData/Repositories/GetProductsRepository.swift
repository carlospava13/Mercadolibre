//
//  GetItemRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

public final class GetProductsRepository: BaseRepository, GetProductsRepositoring {
    public func getItems(item: String) -> AnyPublisher<APIProductResultModel, Error> {
        apiClient.execute(endPointBuilder
            .add(.sites)
            .add(.siteID)
            .add(.search)
            .add(item)
            .build())
    }
}
