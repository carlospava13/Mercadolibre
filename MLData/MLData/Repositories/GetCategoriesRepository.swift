//
//  GetCategoriesRepository.swift
//  MLData
//
//  Created by Carlos Pava on 22/05/21.
//

import Combine
import Foundation

public final class GetCategoriesRepository: BaseRepository, GetCategoryRepositoring {
    public func getCategories() -> AnyPublisher<[CategoryDto], Error> {
        apiClient.execute(endPointBuilder
            .add(.sites)
            .add(.siteID)
            .add(.categories)
            .build())
    }
}
