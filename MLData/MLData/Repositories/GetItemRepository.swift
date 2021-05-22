//
//  GetItemRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine

public final class GetItemRepository: GetItemsRepositoring {
    public init() {}
    let apiClient = APIClient()
    let endpointBuilder = EndPointBuilder()
    
    public func getItems() -> AnyPublisher<APIItemResultModel, Error> {
        apiClient.execute(endpointBuilder
                            .add(.sites)
                            .add(.siteID)
                            .add(.search)
                            .add(.all))
    }
}
