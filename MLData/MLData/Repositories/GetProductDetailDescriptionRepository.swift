//
//  GetProductDetailDescriptionRepository.swift
//  MLData
//
//  Created by Carlos Pava on 23/05/21.
//

import Combine

public final class GetProductDetailDescriptionRepository: BaseRepository, GetProductDetailDescriptionRepositoring {
    public func getproduct(id: String) -> AnyPublisher<[APIProductDetailDescriptionModel], Error> {
        apiClient.execute(endPointBuilder.add(.items).add(id).add(.descriptions).build())
    }
}
