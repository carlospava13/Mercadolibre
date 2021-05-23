//
//  GetProductDetailRepository.swift
//  MLData
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine

public final class GetProductDetailRepository: BaseRepository, GetProductDetailRepositoring {
    public func getproduct(id: String) -> AnyPublisher<APIProductDetailModel, Error> {
        apiClient.execute(endPointBuilder
                            .add(.items)
                            .add(id)
                            .build())
    }
}
