//
//  GetCategoriesRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation
import Combine

public final class GetCategoriesRepository: GetCategoryRepositoring {
    public init() {}
    let apiClient = APIClient()
    let endpointBuilder = EndPointBuilder()
    public func getCategories() -> AnyPublisher<[CategoryDto], Error> {
        apiClient.execute(endpointBuilder
                            .add(.sites)
                            .add(.siteID)
                            .add(.categories))
    }
}
