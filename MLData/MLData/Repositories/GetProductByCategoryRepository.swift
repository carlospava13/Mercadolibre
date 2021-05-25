//
//  GetProductByCategoryRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

public final class GetProductByCategoryRepository: BaseRepository, GetProductByCategoryRepositoring {
    public func getProducts(categoryId: String) -> AnyPublisher<APIProductResultModel, Error> {
        apiClient.execute(endPointBuilder
                            .add(.sites)
                            .add(.siteID)
                            .add(.category)
                            .add(categoryId)
                            .build())
    }
}
